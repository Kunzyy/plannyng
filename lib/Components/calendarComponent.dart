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

  DateTime startTime1 = DateTime.utc(2021, 5, 4, 15, 30);
  DateTime endTime1 = DateTime.utc(2021, 5, 4, 17, 30);

  DateTime startTime2 = DateTime.utc(2021, 6, 4, 17, 30);
  DateTime endTime2 = DateTime.utc(2021, 6, 4, 19, 30);

  Course course1 = Course("2", 4, 15);
  Course course2 = Course("4", 4, 15);
  meetings.add(
      Block(course1, startTime1, endTime1, secondaryColor));
  meetings.add(
      Block(course2, startTime2, endTime2, otherColor));
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

