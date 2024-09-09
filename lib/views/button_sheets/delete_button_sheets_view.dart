import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_models/app_view_model.dart';

class DeleteButtonSheetView extends StatelessWidget {
  const DeleteButtonSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Container(
        height: 125,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  viewModel.deleteAllTasks();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: viewModel.clrlvl1,
                    backgroundColor: viewModel.clrlvl3,
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text("Delete All")),
            SizedBox(
              width: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  viewModel.deleteCompleteTasks();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: viewModel.clrlvl1,
                    backgroundColor: viewModel.clrlvl3,
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text("Delete Completed")),
          ],
        ),
      );
    });
  }
}
