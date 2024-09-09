import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/views/add_task_view.dart';
import 'package:todo/views/header_view.dart';
import 'package:todo/views/task_info_view.dart';
import 'package:todo/views/task_list_view.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                // Header View
                Container(
                  height: MediaQuery.of(context).size.height *
                      0.1, // 10% of screen height
                  child: HeaderView(),
                ),

                // Task Info View
                Container(
                  height: MediaQuery.of(context).size.height *
                      0.3, // 30% of screen height
                  child: TaskInfoView(),
                ),

                // Task List View
                Container(
                  height: MediaQuery.of(context).size.height *
                      0.6, // 60% of screen height
                  child: TaskListView(),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: const AddTaskView(),
    );
  }
}
