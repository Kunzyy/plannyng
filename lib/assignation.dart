import 'classes.dart';

//Modélisation aka temporaire
void createPlannyng(User user, DateTime beginning, DateTime end, Settings settings){
  int duration = end.difference(beginning).inDays;
  int avtime = settings.hourperday * duration;
  List<int> toassign;
  bool warning = false;
  //On regarde le nombre d'heure à assigner par cours
  for(var i; i <= user.courses.length; i++){
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
  //Pour chaque jour, on remplit d'event sans se soucier du cours

  //On assigne les cours aux events et on décrémente la valeur à assigner jusqu'à ne plus rien avoir à assigner

  //Ez pez lem squez? A complexifier pour de meilleurs résultats
}