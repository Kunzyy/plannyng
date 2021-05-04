import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:plannyng/classes.dart';

class StudySessionSource extends CalendarDataSource {
  StudySessionSource(List<Block> source) {
    appointments = source;
  }

  @override
  String getSubject(int index) {
    return appointments[index].course.name;
  }

  @override
  DateTime getStartTime(int index) {
    DateTime startT = DateTime(appointments[index].start.year, appointments[index].start.month, appointments[index].start.day, appointments[index].start.hour, appointments[index].start.minute);
    return startT;
  }

  @override
  DateTime getEndTime(int index) {
    DateTime endT = DateTime(appointments[index].finish.year, appointments[index].finish.month, appointments[index].finish.day, appointments[index].finish.hour, appointments[index].finish.minute);
    return endT;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }
}



List<Block> _getDataSource() {
  List<Block> meetings = <Block>[];

  return meetings;
}

class CalendarComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,

      firstDayOfWeek: 1,
      dataSource: StudySessionSource(_getDataSource()),
      monthViewSettings: MonthViewSettings(
          showAgenda: true,
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
    );
  }
}

