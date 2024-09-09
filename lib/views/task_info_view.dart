import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_models/app_view_model.dart';

class TaskInfoView extends StatelessWidget {
  const TaskInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
              child: Row(
                children: [
                  // Today
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10, top: 5),
                              alignment: Alignment.topLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Icon(
                                  Icons.access_time_outlined,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  alignment: Alignment.bottomLeft,
                                  child: FittedBox(
                                    child: Text(
                                      "Today",
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: viewModel.clrlvl4,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  alignment: Alignment.bottomRight,
                                  child: FittedBox(
                                    child: Text(
                                      "${viewModel.tdycount}",
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: viewModel.clrlvl3,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Scheduled
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10, top: 5),
                              alignment: Alignment.topLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Icon(
                                  Icons.timer_outlined,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  alignment: Alignment.bottomLeft,
                                  child: FittedBox(
                                    child: Text(
                                      "Scheduled",
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: viewModel.clrlvl4,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  alignment: Alignment.bottomRight,
                                  child: FittedBox(
                                    child: Text(
                                      "${viewModel.schedulecount}",
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: viewModel.clrlvl3,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Second Row

          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                children: [
                  // All

                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10, top: 5),
                              alignment: Alignment.topLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Icon(
                                  Icons.autorenew_rounded,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  alignment: Alignment.bottomLeft,
                                  child: FittedBox(
                                    child: Text(
                                      "All",
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: viewModel.clrlvl4,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  alignment: Alignment.bottomRight,
                                  child: FittedBox(
                                    child: Text(
                                      "${viewModel.numTasks}",
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: viewModel.clrlvl3,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Overdue
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10, top: 5),
                              alignment: Alignment.topLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Icon(
                                  Icons.done_outline_sharp,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  alignment: Alignment.bottomLeft,
                                  child: FittedBox(
                                    child: Text(
                                      "Completed",
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: viewModel.clrlvl4,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  alignment: Alignment.bottomRight,
                                  child: FittedBox(
                                    child: Text(
                                      "${viewModel.numTasksComplete}",
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: viewModel.clrlvl3,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
