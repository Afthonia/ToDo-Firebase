import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/task_controller.dart';

import '../constants.dart';
import '../models/todo_model.dart';

class EditTask extends StatelessWidget {
  const EditTask({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    textController.text = todo.text;
    final taskController = Get.find<TaskController>();

    return AlertDialog(
      backgroundColor: Constants.thirdColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Edit The Task!',
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
                    taskController.editTask(textController.text, todo.id);
                    Get.back();
                  },
                  icon: Icon(
                    Icons.published_with_changes,
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
