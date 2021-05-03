import 'classes.dart';

//Modélisation aka temporaire
void createPlannyng(User user, DateTime beginning, DateTime end, Settings settings){
  int duration = end.difference(beginning).inDays;
  int avtime = settings.hourperday * duration;
  List<int> toassign;
  bool warning = false;
  //On regarde le nombre d'heure à assigner par cours
  for(var i = 0; i <= user.courses.length; i++){
    if (user.prog[i].time_left > avtime){
      //Horaire impossible
      toassign.add(avtime);
      avtime = 0;
      warning = true;
    }
    else{
      //Possible, on décompte du temps dispo et on rajoute dans la liste
      toassign.add(user.prog[i].time_left);
      avtime -= user.prog[i].time_left;
    }
  }
  for(var i = 0; i <= duration; i++){
    DateTime actualday = beginning.add(Duration(days: i));
    DateTime tmpbegin = new DateTime(actualday.year, actualday.month, actualday.day, settings.start.hour, settings.start.minute);
    DateTime tmpend = new DateTime(actualday.year, actualday.month, actualday.day, settings.finish.hour, settings.finish.minute);
    DateTime lunchtime = new DateTime(actualday.year, actualday.month, actualday.day, settings.lunchbegin.hour, settings.lunchbegin.minute);
    DateTime lunchtimeend = new DateTime(actualday.year, actualday.month, actualday.day, settings.lunchend.hour, settings.lunchend.minute);
    int blockdurmorn = ((lunchtime.difference(tmpbegin).inMinutes - (settings.durbreak * settings.nbrbreak))/(settings.nbrbreak-1)).toInt();
    int blockduraft = ((tmpend.difference(lunchtimeend).inMinutes - (settings.durbreak * settings.nbrbreak))/(settings.nbrbreak-1)).toInt();
    while(tmpbegin.difference(lunchtime) > Duration(minutes :0)){
      DateTime blockend = tmpbegin.add(Duration(minutes: blockdurmorn));
      Block tmp = Block(tmpbegin, tmpend);
      user.plannyng.add(tmp);
      tmpbegin = blockend.add(Duration(minutes: settings.durbreak));
    }
    tmpbegin = lunchtimeend;
    while(tmpbegin.difference(tmpend) > Duration(minutes :0)){
      DateTime blockend = tmpbegin.add(Duration(minutes: blockduraft));
      Block tmp = Block(tmpbegin, tmpend);
      user.plannyng.add(tmp);
      tmpbegin = blockend.add(Duration(minutes: settings.durbreak));
    }
  }
  //Pour chaque jour, on remplit d'event sans se soucier du cours

  //On assigne les cours aux events et on décrémente la valeur à assigner jusqu'à ne plus rien avoir à assigner

  //Ez pez lem squez? A complexifier pour de meilleurs résultats
}