import 'package:flutter/material.dart';

import 'classes.dart';

//Modélisation aka temporaire
void createPlannyng(User user, DateTime beginning, DateTime end, Settings settings){

  int duration = end.difference(beginning).inDays + 1;
  int avtime = (settings.hourperday * duration) * 60;
  List<int> toassign_exo = [];
  List<int> toassign_theory = [];
  bool warning = false;

  print(settings.hourperday * duration);

  //On regarde le nombre d'heure à assigner par cours
  for(var i = 0; i < user.prog.length; i++){

    if (user.prog[i].time_left_exo > avtime){

      //Horaire impossible
      toassign_exo.add(avtime);
      avtime = 0;
      warning = true;
    }
    else{

      //Possible, on décompte du temps dispo et on rajoute dans la liste
      toassign_exo.add(user.prog[i].time_left_exo);
      avtime -= user.prog[i].time_left_exo;
    }

    if (user.prog[i].time_left_theory > avtime){

      //Horaire impossible
      toassign_theory.add(avtime);
      avtime = 0;
      warning = true;
    }
    else{

      //Possible, on décompte du temps dispo et on rajoute dans la liste
      toassign_theory.add(user.prog[i].time_left_theory);
      avtime -= user.prog[i].time_left_theory;
    }
  }
  //Pour chaque jour, on remplit d'event sans se soucier du cours
  for(var i = 0; i < duration; i++){
    Day tmpday = Day();
    DateTime actualday = beginning.add(Duration(days: i));
    DateTime tmpbegin = new DateTime(actualday.year, actualday.month, actualday.day, settings.start.hour, settings.start.minute);
    DateTime tmpend = new DateTime(actualday.year, actualday.month, actualday.day, settings.finish.hour, settings.finish.minute);
    DateTime lunchtime = new DateTime(actualday.year, actualday.month, actualday.day, settings.lunchbegin.hour, settings.lunchbegin.minute);
    DateTime lunchtimeend = new DateTime(actualday.year, actualday.month, actualday.day, settings.lunchend.hour, settings.lunchend.minute);
    int blockdurmorn = (lunchtime.difference(tmpbegin).inMinutes - (settings.durbreak * settings.nbrbreak))~/(settings.nbrbreak-1);
    int blockduraft = (tmpend.difference(lunchtimeend).inMinutes - (settings.durbreak * settings.nbrbreak))~/(settings.nbrbreak-1);
    user.plannyng.add(tmpday);

    while(lunchtime.difference(tmpbegin) > Duration(minutes :0)){
      DateTime blockend = tmpbegin.add(Duration(minutes: blockdurmorn));
      Block tmp = Block(tmpbegin, blockend);
      user.plannyng[i].am.add(tmp);
      tmpbegin = blockend.add(Duration(minutes: settings.durbreak));
    }

    tmpbegin = lunchtimeend;

    while(tmpend.difference(tmpbegin) > Duration(minutes :0)){
      DateTime blockend = tmpbegin.add(Duration(minutes: blockduraft));
      Block tmp = Block(tmpbegin, blockend);
      user.plannyng[i].pm.add(tmp);
      tmpbegin = blockend.add(Duration(minutes: settings.durbreak));
    }
  }

  //On assigne les co urs aux events et on décrémente la valeur à assigner jusqu'à ne plus rien avoir à assigner
  for(var i =0; i < user.plannyng.length; i++){
    Course morningcourse = Course("none", 1, 1, 1, Colors.white);
    for (var p = 0; p < user.prog.length; p++){
      if (toassign_exo[p] > 0){
        user.plannyng[i].am.forEach((element){
          element.setCourse(user.prog[p].course);
          element.exo = true;
          toassign_exo[p] -= element.finish.difference(element.start).inMinutes;
        });
        morningcourse = user.prog[p].course;
        break;
      }
    }
    for (var p = 0; p < user.prog.length; p++){
      if ((toassign_theory[p] > 0) && (user.prog[p].course != morningcourse)){
        user.plannyng[i].pm.forEach((element){
          element.setCourse(user.prog[p].course);
          element.exo = false;
          toassign_theory[p] -= element.finish.difference(element.start).inMinutes;
        });
        break;
      }
    }
  }
  for(var i =0; i < user.plannyng.length; i++){
    user.plannyng[i].am.forEach((element) {
      if (element.course == null){
        element.setCourse(Course("Pause", 1, 1, 1, Colors.black12));
      }
    });
    user.plannyng[i].pm.forEach((element) {
      if (element.course == null){
        element.setCourse(Course("Pause", 1, 1, 1, Colors.black12));
      }
    });
  }
  //Ez pez lem squez? A complexifier pour de meilleurs résultats
}