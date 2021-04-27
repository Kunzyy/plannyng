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
  TimeOfDay midiPause;

  User(this.name, this.calendars, this.passwordhash, this.courses) {
    // Code if needed.
  }


  //Modélisation aka temporaire
  void createCalendar(){
    var remainingCourse = new Map();
    this.courses.forEach((cours) {
      remainingCourse[cours] = [cours.prog_exo, cours.prog_theory];
    });
    this.calendars[0].days.forEach((day) {
      //on crée les blocs
      //on assigne le bloc qui commence le plus proche de l'heure de midiPause à la pause de midi
      day.blocks.forEach((bloc) {
        //fill it
        //Si avant la pause de midi, cours avec grand interet, sinon bas
        //remainingCourse[cours ajouté][0] -= x pour les exo
        //remainingCourse[cours ajouté][0] -= x pour la théorie
        //quand tout est = 0 à c'est fini
      });
      //On check si tout est fini et si c'est pas le cas alors le planning n'est pas possible à faire
    });
  }
}