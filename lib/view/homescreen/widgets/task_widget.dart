// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/res/colors/app_colors.dart';

import '../../../model/task.dart';
import '../../../utility/utils.dart';
import 'bottomsheet.dart';

class TaskWidget extends StatelessWidget {
  TaskWidget({
    super.key,
    required this.task,
    required this.index,
  });

  final Task task;
  final int index;
  TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: AppColors.purpleColor,
        leading: Text('${index + 1}.'),
        title: Text(task.name),
        subtitle: Text(
            "Date: ${Utils.formatDate(task.taskTime)} Time: ${Utils.formatTime(task.taskTime)}"),
        trailing: task.isCompleted
            ? const SizedBox()
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return MyBottomSheet(task: task);
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: AppColors.greenColor,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  IconButton(
                    onPressed: () {
                      debugPrint(index.toString());
                      taskController.removeTask(index);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: AppColors.redColor,
                    ),
                  ),
                ],
              ));
  }
}
