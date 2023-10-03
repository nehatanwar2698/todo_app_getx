// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/task_controller.dart';

import '../../model/task.dart';
import '../../utility/utils.dart';

class TaskDetail extends StatelessWidget {
  Task task;
  TaskDetail({super.key, required this.task});
  // TaskController taskController = Get.put(TaskController());
  final TaskController taskController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task: ${task.name}')),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            Row(
              children: [
                const Text("Task :"),
                Text(task.name),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                    "Date: ${Utils.formatDate(task.taskTime)} Time: ${Utils.formatTime(task.taskTime)}"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            task.isCompleted
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            task.isCompleted = true;
                            taskController.markTaskCompleted(task);
                            Navigator.pop(context);
                            Utils.showSnakBar(
                                'Task', '${task.name} is completed');
                          },
                          child:const  Text('Mark as Completed')),
                    ),
                  )
          ],
        ),
      )),
    );
  }
}
