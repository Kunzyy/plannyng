import 'package:flutter/material.dart';

class Course {
  String name;
  int repartition;
  int prog_exo;
  int prog_theory;
  int interest;
  int credit;
  int hours;
  Course(this.name, this.repartition, this.prog_exo, this.prog_theory, this.interest, this.credit, this.hours) {
    // Code if needed.
  }
}

class Block {
  Course course;
  TimeOfDay start;
  TimeOfDay finish;
  Color background;
  Block(this.course, this.start, this.finish, this.background) {
    // Code if needed.
  }
}

class User {
  String name;
  String passwordhash;
  List<Course> courses;
  List<Block> plannyng;
  TimeOfDay midiPause;

  User(this.name, this.passwordhash, this.courses) {
    // Code if needed.
  }
}

class Settings {
  int hourperday;
}