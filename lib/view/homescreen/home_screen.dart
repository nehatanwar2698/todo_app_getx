// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/view/homescreen/widgets/bottomsheet.dart';
import 'package:todo_app/view/homescreen/widgets/task_widget.dart';
import 'package:todo_app/view/task_detail/task_detail.dart';

import '../../res/strings.dart/strings.dart';
import '../../utility/utils.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs (Incomplete and Completed)
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            AppStrings.todoApp,
            style:
                Utils.setFontStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: AppStrings.inComplete),
              Tab(text: AppStrings.inCompleted),
            ],
          ),
        ),
        body: Obx(() => TabBarView(
              children: [
                // Incomplete Tasks Tab
                _buildTasksList(context, isCompleted: false),

                // Completed Tasks Tab
                _buildTasksList(context, isCompleted: true),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Show the modal bottom sheet when the FAB is pressed.
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return MyBottomSheet();
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildTasksList(BuildContext context, {bool isCompleted = false}) {
    final tasks = taskController.taskList
        .where((task) => task.isCompleted == isCompleted)
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: tasks.length == 0
          ? const Center(child: Text(AppStrings.noDataFound))
          : ListView.separated(
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                Task task = tasks[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskDetail(task: task),
                      ),
                    );
                  },
                  child: TaskWidget(
                    task: task,
                    index: index,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 12,
                );
              },
            ),
    );
  }
}
