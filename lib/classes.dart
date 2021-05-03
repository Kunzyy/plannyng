import 'package:flutter/material.dart';

class Course {
  String name;
  int repartition;
  int hours_exo;
  int hours_theory;
  Course(this.name, this.repartition, this.hours_exo, this.hours_theory) {
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
  Progression(this.course, [this.time_left_exo, this.time_left_theory, this.prog_exo, this.prog_theory, this.interest]){
    //
  }
}

class Block {
  Course course;
  DateTime start;
  DateTime finish;
  Color background;
  bool exo;
  bool done;
  Block(this.start, this.finish, [this.course, this.background, this.exo]) {
    // Code if needed.
  }
}

class User {
  String name;
  String passwordhash;
  List<Progression> prog;
  List<Block> plannyng;

  User(this.name, this.passwordhash, this.prog) {
    // Code if needed.
  }

  listeStrings() {
    List<String> listeStringHeures = [];
    List<String> listeStringRepart = [];

    for (var i = 0; i < prog.length; i++) {
      listeStringHeures.add(prog[i].course.stringHours());
      listeStringRepart.add(prog[i].course.stringRepartition());
    }

    return [listeStringHeures, listeStringRepart];
  }
}

class Settings {
  int hourperday;
  TimeOfDay start;
  TimeOfDay finish;
  int nbrbreak;
  int durbreak;
  TimeOfDay lunchbegin;
  TimeOfDay lunchend;
}