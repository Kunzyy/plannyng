import 'classes.dart';

//Modélisation aka temporaire
void createPlannyng(User user, DateTime beginning, DateTime end, Settings settings){
  int duration = end.difference(beginning).inDays;
  int avtime = settings.hourperday * duration;
  int needtime = 0;
  bool warning = false;
  for(var i; i <= user.courses.length; i++){
    needtime += user.courses[i].hours;
    if (needtime > avtime){
      //Horaire impossible
    }
  }
}