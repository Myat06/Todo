import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_models/app_view_model.dart';
import 'package:todo/views/button_sheets/add_task_button_sheett_view.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return SizedBox(
          height: 60,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: viewModel.clrlvl3,
                  foregroundColor: viewModel.clrlvl1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                HapticFeedback.heavyImpact();
                viewModel.buttonSheetBuilder(
                    const AddTaskButtonSheetView(), context);
              },
              child: const Icon(
                Icons.add,
                size: 20,
              )),
        );
      },
    );
  }
}
