import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/view_models/app_view_model.dart';

class ScheduleButtonSheetView extends StatefulWidget {
  const ScheduleButtonSheetView({super.key});

  @override
  State<ScheduleButtonSheetView> createState() =>
      _ScheduleButtonSheetViewState();
}

class _ScheduleButtonSheetViewState extends State<ScheduleButtonSheetView> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime fousedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Selected Date = ${today.toString().split(" ")[0]}"),
            Container(
                child: TableCalendar(
              locale: "en_US",
              rowHeight: 43,
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              onDaySelected: _onDaySelected,
            )),
          ],
        ),
      );
    });
  }
}
