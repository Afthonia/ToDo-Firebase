import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constants.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/models/todo_model.dart';

class ConfirmDeleting extends StatelessWidget {
  const ConfirmDeleting({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Are You Sure To Delete Your Task?',
            style: TextStyle(
              color: Constants.secondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {
                    taskController.deleteTask(todo.id);
                    Get.back(closeOverlays: true);
                    Get.showSnackbar(GetSnackBar(
                      title: 'Deleted!',
                      message: 'Your task is successfully deleted!',
                      backgroundColor: Constants.mainColor.withOpacity(0.5),
                      duration: const Duration(seconds: 3),
                    ));
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
