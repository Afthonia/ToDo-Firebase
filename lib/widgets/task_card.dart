import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/widgets/confirm_deleting.dart';
import 'package:todo/widgets/edit_task.dart';

import '../constants.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      child: Card(
        color: Constants.mainColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      todo.text,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        decoration: todo.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: Constants.secondaryColor,
                      ),
                    ),
                    value: todo.isCompleted,
                    activeColor: Constants.secondaryColor,
                    checkColor: Constants.thirdColor,
                    onChanged: (_) {
                      taskController.toggle(todo.id);
                    },
                  ),
                ),
                VerticalDivider(
                  width: 2.0,
                  color: Constants.thirdColor,
                  thickness: 1.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Get.dialog(EditTask(todo: todo));
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Constants.secondaryColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Get.dialog(ConfirmDeleting(todo: todo));
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Constants.secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}