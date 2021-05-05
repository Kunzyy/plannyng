import 'package:flutter/material.dart';
import 'package:plannyng/Constants.dart';

class ProgException implements Exception {
  String cause;
  ProgException(this.cause);
}

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
  Progression(this.course, [this.prog_exo, this.prog_theory, this.interest]){
    this.time_left_exo = this.course.hours_exo;
    this.time_left_theory = this.course.hours_theory;

    //
  }
}

class Block {
  Course course;
  DateTime start;
  DateTime finish;
  Color background;
  bool exo;
  bool done; //true if done
  Block(this.start, this.finish, [this.course, this.background, this.exo]) {
    // Code if needed.
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
      plannedplannyng.addAll(this.plannyng[i].am)
      plannedplannyng.addAll(this.plannyng[i].pm)
    }
    return plannedplannyng;
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
  int nbrbreak;
  int durbreak;
  TimeOfDay lunchbegin;
  TimeOfDay lunchend;
}