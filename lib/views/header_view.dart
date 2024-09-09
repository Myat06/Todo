import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_models/app_view_model.dart';
import 'package:todo/views/button_sheets/delete_button_sheets_view.dart';
import 'package:todo/views/button_sheets/setting_button_sheet_view.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Row(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            "Welcome ${viewModel.username},",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: viewModel.clrlvl4),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            "You have work today",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: viewModel.clrlvl4),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  viewModel.buttonSheetBuilder(
                      DeleteButtonSheetView(), context);
                },
                child: Icon(
                  Icons.delete,
                  color: viewModel.clrlvl3,
                  size: 40,
                ),
              )),
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  viewModel.buttonSheetBuilder(
                      SettingsButtonSheetView(), context);
                },
                child: Icon(
                  Icons.settings,
                  color: viewModel.clrlvl3,
                  size: 40,
                ),
              )),
        ],
      );
    });
  }
}
