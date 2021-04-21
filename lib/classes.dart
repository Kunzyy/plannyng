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
  int length;
  bool theory;
  Block(this.course, this.length, this.theory) {
    // Code if needed.
  }
}

class Day {
  List<Block> blocks;
  DateTime date;
  TimeOfDay start;
  TimeOfDay finish;
  Day(this.blocks, this.date, this.start, this.finish) {
    // Code if needed.
  }
}

class Calendar {
  List<Day> days;
  Calendar(this.days) {
    // Code if needed.
  }
}

class User {
  String name;
  List<Calendar> calendars;
  String passwordhash;
  List<Course> courses;

  User(this.name, this.calendars, this.passwordhash, this.courses) {
    // Code if needed.
  }
}