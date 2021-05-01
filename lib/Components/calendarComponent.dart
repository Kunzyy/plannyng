import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:plannyng/Constants.dart';
import 'package:plannyng/classes.dart';

class StudySessionSource extends CalendarDataSource {
  StudySessionSource(List<Block> source) {
    appointments = source;
  }

  @override
  String getSubject(int index) {
    return appointments[index].course;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].start;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].finish;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }
}


class CalendarComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      firstDayOfWeek: 1,
    );
  }

}
