import 'package:flutter/material.dart';
import 'classes.dart';
import 'package:plannyng/Constants.dart';

User getUser() {
  List<Progression> coursList = [];
  for (var i = 0; i < listeCours.length ; i ++) {
    Course tmp = Course(listeCours[i], repartCours[i], heuresCours[i]);
    Progression progtmp = Progression(tmp);
    coursList.add(progtmp);
  }
  User user = User("Agathe Moineau", "Password", coursList);
  return user;
}

