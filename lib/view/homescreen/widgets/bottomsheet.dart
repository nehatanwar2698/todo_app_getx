// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/res/strings.dart/strings.dart';
import 'package:todo_app/utility/utils.dart';

import '../../../model/task.dart';

class MyBottomSheet extends StatefulWidget {
  Task? task;
  MyBottomSheet({super.key, this.task});

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  TextEditingController taskController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final TaskController controller = Get.find();
  FocusScopeNode _focusScopeNode = FocusScopeNode();

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      taskController.text = widget.task!.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
            //* if we have something content on the screen which is hide by a Keyboard then we can calculate the size of the keyboard or thing which is in top by MediaQuery.of(context).viewInsets.bottom
            bottom: 24 + MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: taskController,
              focusNode: _focusScopeNode,
              decoration:
                  const InputDecoration(labelText: AppStrings.enterTask),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
                Text(
                  "${selectedDate.toLocal()}".split(' ')[0],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.access_time),
                  onPressed: () {
                    _focusScopeNode.unfocus();

                    _selectTime(context);
                  },
                ),
                Text(
                  selectedTime.format(context),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _focusScopeNode.unfocus();

                if (widget.task == null) {
                  addTask();
                } else {
                  widget.task!.name = taskController.text;
                  widget.task?.taskTime = DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    selectedTime.hour,
                    selectedTime.minute,
                  );
                  controller.editTask(widget.task!);
                  Get.back();
                }
              },
              child: Text(
                  widget.task == null ? AppStrings.add : AppStrings.update),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void addTask() {
    if (taskController.text.isEmpty) {
      Utils.toastMessage('Please enter task');
    } else {
      controller.addTask(
        Task(
          name: taskController.text,
          taskTime: DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute,
          ),
        ),
      );
      Get.back();
    }
  }
}
