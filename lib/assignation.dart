import 'classes.dart';

//Modélisation aka temporaire
void createCalendar(User user, DateTime beginning, DateTime end){
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