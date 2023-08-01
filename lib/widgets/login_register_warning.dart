import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constants.dart';
import 'package:todo/screens/login_register.dart';

class LoginRegisterWarning extends StatelessWidget {
  const LoginRegisterWarning({super.key});


  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text(
        "You Cannot Add Any Task Because You Are Not Logged In Or Registered Yet!",
        textAlign: TextAlign.center,
        style: TextStyle(
              color: Constants.secondaryColor,
              fontWeight: FontWeight.bold,
            ),
        ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Do You Want To Go To The Login/Register Page?',
            style: TextStyle(
              color: Constants.secondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {
                    Get.to(const LoginRegister());
                  },
                  icon: const Icon(Icons.check),
                  color: Constants.secondaryColor,
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close),
                  color: Constants.secondaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Constants.thirdColor,
    );
  }
}
