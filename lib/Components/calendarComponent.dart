import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:plannyng/classes.dart';
import 'package:plannyng/Constants.dart';
import 'package:plannyng/Screens/eventPage.dart';

import '';

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



List<Block> _getDataSource(user) {
  List<Block> meetings = <Block>[];

  // print(user.plannyng);
  //
  // if(user.plannyng.isEmpty == false) {
  //   print("Test");
  //   for (var i = 0; i< user.plannyng.length; i++) {
  //     print("AM " + i.toString());
  //     print(user.plannyng[0].am);
  //     print("PM " + i.toString());
  //     print(user.plannyng[0].pm);
  //
  //   }
  // }

  //meetings = user.planplannyng();

  Course cours = Course("test", 4, 4, 4, Colors.blue);
  meetings.add(Block(DateTime.now().add(Duration(seconds: 10)), DateTime.now().add(Duration(minutes:10)), cours));


  // print("Meetings");
  // print(meetings);
  // Course cours = Course("test", 4, 4, 4, Colors.blue);
  // meetings.add(Block(DateTime.now().add(Duration(minutes:1)), DateTime.now().add(Duration(minutes:10)), cours));


  // final course1 = Course("course1", 2, 15, 3);
  // final block1 = Block(DateTime(2021,5,4,15),DateTime(2021,5,4,17),course1,secondaryColor, true);
  //
  // meetings.add(block1);

  return meetings;
}

class CalendarComponent extends StatefulWidget {
  User user;
  CalendarComponent({ @required this.user, Key key,}) : super(key:key);

  @override
  _CalendarComponentState createState() => _CalendarComponentState(user);
}


class _CalendarComponentState extends State<CalendarComponent> {
  User user;
  _CalendarComponentState(this.user);

  @override
  Widget build(BuildContext context) {
    void calendarTapped(CalendarTapDetails calendarTapDetails) {
      if (calendarTapDetails.targetElement == CalendarElement.appointment) {
        Block appointment = calendarTapDetails.appointments[0];
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventPage(appointment:appointment)),
        );
      }
    }
    return SfCalendar(
      view: CalendarView.month,
      onTap: calendarTapped,
      firstDayOfWeek: 1,
      dataSource: StudySessionSource(_getDataSource(user)),
      monthViewSettings: MonthViewSettings(
          showAgenda: true,
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
    );
  }
}

