import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constants.dart';
import 'package:todo/controllers/task_controller.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();
    var textController = TextEditingController();

    return AlertDialog(
      backgroundColor: Constants.thirdColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add A New Task!',
            style: TextStyle(
              color: Constants.secondaryColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  controller: textController,
                  cursorColor: Constants.secondaryColor,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Constants.secondaryColor,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Constants.secondaryColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    taskController.addTask(textController.text);
                    Get.back();
                  },
                  icon: Icon(
                    Icons.add,
                    color: Constants.secondaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
