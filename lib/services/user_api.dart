import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserApi {
  static Future<UserCredential?> signIn() async {
    try {
      final GoogleSignInAccount? user = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? auth = await user?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: auth?.accessToken,
        idToken: auth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
      
    } catch (e) {
      debugPrint("Google Auth Error: $e");
    }
    return null;
  }

  static Future<void> signOut() async {
    try {
      FirebaseAuth.instance.signOut();

    } catch (e) {
      debugPrint("Signing Out Error: $e");
    }
  }

  static Future<bool> isUserExist(String? userId) async {
    try {
      final user = await FirebaseFirestore.instance.collection('users').doc(userId).get();

      return user.exists;

    } catch (e) {
      debugPrint("User Detecting Error: $e");
    }
    return false;
  }
}
