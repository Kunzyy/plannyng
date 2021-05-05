import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import 'Constants.dart';

class ProgException implements Exception {
  String cause;
  ProgException(this.cause);
}

class NotificationHelper {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  static final android = new AndroidInitializationSettings('@mipmap/ic_launcher');
  static final iOS = new IOSInitializationSettings();
  static final initSetttings = new InitializationSettings(android, iOS);

  static Future<void> init() async {
    print("notif init");

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
    tz.initializeDatabase([]);
  }

  static Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    showDialog(
      builder: (_) => new AlertDialog(
        title: new Text('Notification'),
        content: new Text('$payload'),
      ),
    );
  }
  static final _androidNotificationDetails = AndroidNotificationDetails(
    'channel id',
    'channel name',
    'channel description',
    priority: Priority.High,
    importance: Importance.Max
  );
  static final _iOSNotificationDetails = new IOSNotificationDetails();
  static final platform = new NotificationDetails(_androidNotificationDetails, _iOSNotificationDetails);
  static Future<void> scheduleNotifBlock(Block block) async {
    print("hello notif");
    //await flutterLocalNotificationsPlugin.show(
    //    1, 'New Tutorial', 'Local Notification', platform,
    //    payload: 'AndroidCoding.in');

    //await flutterLocalNotificationsPlugin.schedule(
    //    0, 'Test 1', 'Test 2',DateTime.now().add(const Duration(seconds: 5)) ,platform,
    //    payload: 'Test 3');

  }
  static Future<void> cancelNotif(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}

class Course {
  String name;
  int repartition;
  int hours_exo;
  int hours_theory;
  Color backgroundColor;
  Course(this.name, this.repartition, this.hours_exo, this.hours_theory, this.backgroundColor) {
    // Code if needed.
  }
  stringRepartition() {
    return repartition.toString() + "% Théorie et " + (100-repartition).toString() + "% Exercices + TPs";
  }
  stringHours() {
    return (hours_exo + hours_theory).toString() + " heures d'études prévues";
  }
}

class Progression {
  Course course;
  int time_left_exo;
  int time_left_theory;
  int prog_exo;
  int prog_theory;
  int interest;
  Progression(this.course, [this.prog_exo, this.prog_theory, this.interest]){
    this.time_left_exo = this.course.hours_exo;
    this.time_left_theory = this.course.hours_theory;
    //
  }
}

class Block {
  Course course;
  int id;
  DateTime start;
  DateTime finish;
  Color background;
  bool exo;
  bool done; //true if done
  Block(this.start, this.finish, [this.course, this.exo, this.id]) {
    if(this.course != null) {
      this.background = course.backgroundColor;
    }
    else {
      this.background = primaryColor;

    }
  }
  setCourse (course) {
    this.course = course;
    this.background = course.backgroundColor;
  }
}

class Day{
  List<Block> am;
  List<Block> pm;
  Day() {
    this.am = [];
    this.pm = [];
  }
}

class User {
  String name;
  String passwordhash;
  List<Progression> prog;
  List<Day> plannyng;

  User(this.name, this.passwordhash, this.prog) {
    this.plannyng = [];
  }

  planplannyng() {
    List<Block> plannedplannyng = [];
    for (var i = 0; i < this.plannyng.length; i++){
      plannedplannyng.addAll(this.plannyng[i].am);
      plannedplannyng.addAll(this.plannyng[i].pm);
    }
    return plannedplannyng;
  }

  listeStrings() {
    List<String> listeStringHeures = [];
    List<String> listeStringRepart = [];
    List<String> listeCours = [];

    for (var i = 0; i < prog.length; i++) {
      listeStringHeures.add(prog[i].course.stringHours());
      listeStringRepart.add(prog[i].course.stringRepartition());
      listeCours.add(prog[i].course.name);
    }

    return [listeStringHeures, listeStringRepart, listeCours];
  }

  progUpdate () {
    DateTime now = DateTime.now();
    this.plannyng.forEach((day) {
      day.am.forEach((element) {
        if (!element.done && element.finish.isBefore(now)) {
          this.prog.forEach((j) {
            if (j.course == element.course) {
              int timeTaken = element.finish
                  .difference(element.start)
                  .inMinutes;
              if (element.exo) {
                try {
                  j.time_left_exo -= timeTaken;
                  if (j.time_left_exo < 0)
                    throw new ProgException("time_left_exo < 0");
                } on ProgException {
                  print(
                      "Time Left Exo is below 0, this shouldn't be possible. Time_left_exo is being set to 0");
                  j.time_left_exo = 0;
                }
              }
              else {
                try {
                  j.time_left_theory -= timeTaken;
                  if (j.time_left_theory < 0)
                    throw new ProgException("time_left_theory < 0");
                } on ProgException {
                  print(
                      "Time Left Theory is below 0, this shouldn't be possible. time_left_theory is being set to 0");
                  j.time_left_theory = 0;
                }
              }
              j.prog_exo =100-(100*j.time_left_exo / j.course.hours_exo) as int;
              j.prog_theory = 100-(100*j.time_left_theory / j.course.hours_theory) as int;
            }
          });
        }
      });
      day.pm.forEach((element) {
        if (!element.done && element.finish.isBefore(now)) {
          this.prog.forEach((j) {
            if (j.course == element.course) {
              int timeTaken = element.finish
                  .difference(element.start)
                  .inMinutes;
              if (element.exo) {
                try {
                  j.time_left_exo -= timeTaken;
                  if (j.time_left_exo < 0)
                    throw new ProgException("time_left_exo < 0");
                } on ProgException {
                  print(
                      "Time Left Exo is below 0, this shouldn't be possible. Time_left_exo is being set to 0");
                  j.time_left_exo = 0;
                }
              }
              else {
                try {
                  j.time_left_theory -= timeTaken;
                  if (j.time_left_theory < 0)
                    throw new ProgException("time_left_theory < 0");
                } on ProgException {
                  print(
                      "Time Left Theory is below 0, this shouldn't be possible. time_left_theory is being set to 0");
                  j.time_left_theory = 0;
                }
              }
              j.prog_exo =100-(100*j.time_left_exo / j.course.hours_exo) as int;
              j.prog_theory = 100-(100*j.time_left_theory / j.course.hours_theory) as int;
            }
          });
        }
      });
    });

  }

  redoBlocks(Block block) {
    block.done = false;

    this.prog.forEach((j) {
      if(j.course == block.course){
        int timeTaken = block.finish.difference(block.start).inMinutes;
        if(block.exo){
          j.time_left_exo += timeTaken;
        }
        else {
          j.time_left_theory += timeTaken;
        }
      }
    });
  }
}

class Settings {
  int hourperday;
  TimeOfDay start;
  TimeOfDay finish;
  int nbrbreak_am;
  int durbreak_am;
  int nbrbreak_pm;
  int durbreak_pm;
  TimeOfDay lunchbegin;
  TimeOfDay lunchend;
}