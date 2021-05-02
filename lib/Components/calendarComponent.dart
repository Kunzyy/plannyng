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
    return appointments[index].course.name;
  }

  @override
  DateTime getStartTime(int index) {
    DateTime startT = DateTime(2021, 5, 2, appointments[index].start.hour, appointments[index].start.minute);
    return startT;
  }

  @override
  DateTime getEndTime(int index) {
    DateTime endT = DateTime(2021, 5, 2, appointments[index].finish.hour, appointments[index].finish.minute);
    return endT;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }
}


List<Block> _getDataSource() {
  final List<Block> meetings = <Block>[];
  final TimeOfDay startTime = TimeOfDay(hour: 15, minute: 0);
  final TimeOfDay endTime = TimeOfDay(hour: 17, minute: 0);
  final Course course1 = Course("course1", 4, 15);
  final Course course2 = Course("course2", 4, 15);
  meetings.add(
      Block(course1, startTime, endTime, secondaryColor));
  meetings.add(
      Block(course2, startTime, endTime, otherColor));
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
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
    );
  }
}

