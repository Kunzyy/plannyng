import 'package:flutter/material.dart';

class Course {
  String name;
  int repartition;
  int hours;
  Course(this.name, this.repartition, this.hours) {
    // Code if needed.
  }
  stringRepartition() {
    return repartition.toString() + "% Théorie et " + (100-repartition).toString() + "% Exercices + TPs";
  }
  stringHours() {
    return hours.toString() + " heures d'études prévues";
  }
}

class Progression {
  String name;
  int time_left;
  int prog_exo;
  int prog_theory;
  int interest;
  Progression(this.name, this.time_left, this.prog_exo, this.prog_theory, this.interest){
    //
  }
}

class Block {
  Course course;
  DateTime start;
  DateTime finish;
  Color background;
  Block(this.start, this.finish, [this.course, this.background]) {
    // Code if needed.
  }
}

class User {
  String name;
  String passwordhash;
  List<Course> courses;
  List<Progression> prog;
  List<Block> plannyng;
  TimeOfDay midiPause;

  User(this.name, this.passwordhash, this.courses) {
    // Code if needed.
  }

  listeStrings() {
    List<String> listeStringHeures = [];
    List<String> listeStringRepart = [];

    for (var i = 0; i < courses.length; i++) {
      listeStringHeures.add(courses[i].stringHours());
      listeStringRepart.add(courses[i].stringRepartition());
    }

    return [listeStringHeures, listeStringRepart];
  }
}

class Settings {
  int hourperday;
  TimeOfDay start;
  TimeOfDay finish;
  int durcourse;
  int durbreak;
}