import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/view_models/app_view_model.dart';
import 'package:todo/views/button_sheets/schedule_button_sheet_view.dart';

class AddTaskButtonSheetView extends StatefulWidget {
  const AddTaskButtonSheetView({super.key});

  @override
  State<AddTaskButtonSheetView> createState() => _AddTaskButtonSheetViewState();
}

class _AddTaskButtonSheetViewState extends State<AddTaskButtonSheetView> {
  var hour = 0;
  var minute = 0;
  var timeFormat = "AM";
  var date = " ";

  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController = TextEditingController();
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Container(
            height: 500,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              date = "Today";
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: date == "Today"
                                ? Colors.purple.shade100
                                : Colors.white,
                          ),
                          child: const Text("Today"),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              date = "Schedule";
                            });
                            viewModel.buttonSheetBuilder(
                                ScheduleButtonSheetView(), context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: date == "Schedule"
                                ? Colors.purple.shade100
                                : Colors.white,
                          ),
                          child: const Text("Schedule"),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        "Label",
                        style: TextStyle(
                            color: viewModel.clrlvl4,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          height: 40,
                          width: 250,
                          child: TextField(
                            onSubmitted: (value) {
                              if (entryController.text.isNotEmpty &&
                                  (date == "Today" || date == "Schedule")) {
                                viewModel.numTasksToday(date);
                                Task newTask =
                                    Task(entryController.text, false, date);
                                viewModel.addTask(newTask);
                                entryController.clear();
                                Navigator.of(context).pop();
                              }
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: 5),
                                filled: true,
                                fillColor: viewModel.clrlvl2,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none))),
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            cursorColor: viewModel.clrlvl4,
                            autofocus: false,
                            autocorrect: false,
                            controller: entryController,
                            style: TextStyle(
                                color: viewModel.clrlvl4,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pick Your Time! ${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")} $timeFormat ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            NumberPicker(
                              minValue: 0,
                              maxValue: 12,
                              value: hour,
                              zeroPad: true,
                              infiniteLoop: true,
                              itemWidth: 80,
                              itemHeight: 60,
                              onChanged: (value) {
                                setState(() {
                                  hour = value;
                                });
                              },
                              textStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 20),
                              selectedTextStyle: const TextStyle(
                                  color: Colors.white, fontSize: 30),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Colors.white),
                                      bottom: BorderSide(color: Colors.white))),
                            ),
                            NumberPicker(
                              minValue: 0,
                              maxValue: 60,
                              value: minute,
                              zeroPad: true,
                              infiniteLoop: true,
                              itemWidth: 80,
                              itemHeight: 60,
                              onChanged: (value) {
                                setState(() {
                                  minute = value;
                                });
                              },
                              textStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 20),
                              selectedTextStyle: const TextStyle(
                                  color: Colors.white, fontSize: 30),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Colors.white),
                                      bottom: BorderSide(color: Colors.white))),
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      timeFormat = "AM";
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: timeFormat == "AM"
                                            ? Colors.grey.shade800
                                            : Colors.grey.shade700,
                                        border: Border.all(
                                            color: timeFormat == "PM"
                                                ? Colors.grey.shade800
                                                : Colors.grey.shade700)),
                                    child: const Text(
                                      "AM",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      timeFormat = "PM";
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: timeFormat == "PM"
                                            ? Colors.grey.shade800
                                            : Colors.grey.shade700,
                                        border: Border.all(
                                            color: timeFormat == "PM"
                                                ? Colors.grey.shade800
                                                : Colors.grey.shade700)),
                                    child: const Text(
                                      "PM",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
