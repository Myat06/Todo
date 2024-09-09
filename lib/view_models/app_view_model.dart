import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/view_model.dart';

class AppViewModel extends ChangeNotifier {
  List<Task> tasks = <Task>[];
  User user = User("Jettz");
  final TextEditingController entryController = TextEditingController();

  int tdycount = 0;
  int schedulecount = 0;

  Color clrlvl1 = Colors.grey.shade50;
  Color clrlvl2 = Colors.grey.shade200;
  Color clrlvl3 = Colors.grey.shade800;
  Color clrlvl4 = Colors.grey.shade900;

  String pickedtime = "00:00 AM";

  int get numTasks => tasks.length;

  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  String get username => user.username;

  int get numTasksComplete => tasks.where((task) => task.complete).length;

  void numTasksToday(String date) {
    if (date == "Today") {
      tdycount++;
    } else if (date == "Schedule") {
      schedulecount++;
    }
  }

  void delTasksToday(String date) {
    if (date == "Today") {
      tdycount--;
    } else if (date == "Schedule") {
      schedulecount--;
    }
  }

  bool getTaskValue(int taskIndex) {
    return tasks[taskIndex].complete;
  }

  String getTaskTitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

  void deleteTask(int taskIndex) {
    String taskDate =
        tasks[taskIndex].date; // Assuming Task has a date property
    tasks.removeAt(taskIndex);
    delTasksToday(taskDate); // Adjust the counters
    notifyListeners();
  }

  void setTaskValue(int taskIndex, bool taskValue) {
    tasks[taskIndex].complete = taskValue;
    notifyListeners();
  }

  void updateUsername(String newUsername) {
    user.username = newUsername;
    notifyListeners();
  }

  void deleteAllTasks() {
    tasks.clear();
    tdycount = 0;
    schedulecount = 0;
    notifyListeners();
  }

  void deleteCompleteTasks() {
    tasks.removeWhere((task) => task.complete);
    // Recalculate tdycount and schedulecount
    tdycount = tasks.where((task) => task.date == "Today").length;
    schedulecount = tasks.where((task) => task.date == "Schedule").length;
    notifyListeners();
  }

  void buttonSheetBuilder(Widget buttonSheetView, BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: ((context) {
          return buttonSheetView;
        }));
  }
}
