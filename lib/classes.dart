import 'package:flutter/material.dart';

class Course {
  String name;
  int repartition;
  int prog_exo;
  int prog_theory;
  int interest;
  int credit;
  Course(this.name, this.repartition, this.prog_exo, this.prog_theory, this.interest, this.credit) {
    // Code if needed.
  }
}

class Block {
  Course course;
  TimeOfDay start;
  TimeOfDay finish;
  bool theory;
  Block(this.course, this.start, this.finish, this.theory) {
    // Code if needed.
  }
}

class Day {
  List<Block> blocks;
  DateTime date;
  Day(this.blocks, this.date) {
    // Code if needed.
  }
}

class Calendar {
  List<Day> days;
  Calendar(DateTime begin, DateTime end) {
    int difference = end.difference(begin).inDays;
    for(var i; i <= difference; i++){
      DateTime tmpdate = begin.add(Duration(days: i));
      Day tmpday = Day([], tmpdate);
      days.add(tmpday);
    }
  }
}

class User {
  String name;
  List<Calendar> calendars;
  String passwordhash;
  List<Course> courses;
  TimeOfDay midiPause;

  User(this.name, this.calendars, this.passwordhash, this.courses) {
    // Code if needed.
  }
}