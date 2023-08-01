import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/user_controller.dart';
import 'package:todo/screens/home.dart';

//import 'package:todo/screens/home.dart';

import '../constants.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Scaffold(
      backgroundColor: Constants.thirdColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Login / Register',
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
            color: Constants.secondaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Constants.mainColor,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await userController.createUser();
              Get.to(const Home());
              userController.changeAuthState();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                    'assets/google.png',
                  width: MediaQuery.of(context).size.width/4,
                ),
                const SizedBox(width: 10.0),
                Text(
                    'Login / Register',
                  style: TextStyle(
                    color: Constants.secondaryColor,
                    fontSize: MediaQuery.of(context).size.width/18
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }
}
