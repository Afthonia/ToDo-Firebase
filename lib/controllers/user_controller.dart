import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/models/user_model.dart';
import 'package:todo/services/user_api.dart';

class UserController extends GetxController {
  final auth = FirebaseAuth.instance;

  final store = FirebaseFirestore.instance;

  final authStateIcon = (Icons.login_rounded).obs;

  late Rx<User?> user;

  final currentUser = UserModel("", "", "").obs;

  final authState = false.obs;


  Future<void> createUser() async {
    final user = await UserApi.signIn();

    if (!await isUserExist(user!.credential?.providerId)) {
      final newUser = UserModel(user.user!.uid, user.user?.displayName, user.user?.email);
      await store.collection('users').doc(user.user?.uid).set(newUser.toMap());
    }
  }

  Future<bool> isUserExist(String? userId) async {
    final result = UserApi.isUserExist(userId);

    return result;
  }

  Future<void> signOut() async {
    await UserApi.signOut();
  }

  void changeAuthState() {
    authState.toggle();
    print(authState);

    authStateIcon.value = authState.value ? Icons.logout_rounded : Icons.login_rounded;
  }

  @override
  void onInit() {
    super.onInit();

    authState.value = auth.currentUser != null;
    authStateIcon.value = authState.value ? Icons.logout_rounded : Icons.login_rounded;

    user = Rx<User?>(auth.currentUser);
    user.bindStream(auth.authStateChanges());

    ever(user, (value) {
      print(value);

      if (value == null) {
        currentUser.value = UserModel("", "", "");
      } else {
        currentUser.value = UserModel(user.value!.uid, user.value!.displayName, user.value!.email);
      }
      
      TaskController.taskController.getTasks();
    });
  }
}
