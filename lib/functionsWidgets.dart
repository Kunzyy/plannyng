import 'package:flutter/material.dart';
import 'classes.dart';
import 'package:plannyng/Constants.dart';
import 'assignation.dart';

createCardPlanSess(String texte) {
  return Padding(
    padding: paddingCard,
    child: Card(
      child: Padding(
        padding: paddingCard,
        child: Text(texte,
          style: titreButton,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

List<Widget> createCard(String titre, List<String> listeEtiquette, List<String> listeValeur1, [List<String> listeValeur2, List<String> listeValeur3]) {
  List<Widget> listeWidget = [];

  listeWidget.add(Padding(
      padding: paddingCard,
      child: Text(titre,
        style: titreCard,
      )
  ));

  for (var i = 0; i < listeEtiquette.length; i++) {
    String texte = listeEtiquette[i] + " : " + listeValeur1[i];
    if (listeValeur2 != null) {
      texte += (" ( " + listeValeur2[i]);
      if (listeValeur3 != null) {
        texte += (" " + listeValeur3[i]);
      }
      else {
        texte += " )";
      }
    }
    var tmp = Padding(
        padding: paddingCard,
        child: Text(texte,
          style: listeCard,
        )
    );

    listeWidget.add(tmp);
  }
  return listeWidget;
}

redirect(context, newContext, [bool replacement]) {
  dynamic newRoute = MaterialPageRoute(builder: (context) => newContext);
  if (replacement == false) {
    Navigator.push(context, newRoute);
  }
  else {
    Navigator.pushReplacement(context, newRoute);
  }
}

calculateAndRedirect(context, newContext, user, dateDebut, dateFin, settings, [bool replacement]) {
  // Calcul du planning
  createPlannyng(user, dateDebut, dateFin, settings);

  // Actualisation du Home
  redirect(context, newContext, true);
  return user;
}

Future<void> confirmPlan(context, newContext, user, dateDebut, dateFin, heureJour, heureDebut, heureFin, nombrePauses, dureePauses, heureDebutLunch, heureFinLunch) async {
  Settings settings = Settings();

  settings.hourperday = heureJour;
  settings.start = toToD(heureDebut);
  settings.finish = toToD(heureFin);
  settings.nbrbreak_am = nombrePauses;
  settings.durbreak_am = dureePauses;
  settings.nbrbreak_pm = nombrePauses;
  settings.durbreak_pm = dureePauses;
  settings.lunchbegin = toToD(heureDebutLunch);
  settings.lunchend = toToD(heureFinLunch);

  return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Plannyng"),
          content: Text("Planning calculé"),
          actions: [
            TextButton(
              child: Text('Annuler'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
                child: Text('Valider'),
                onPressed : () => user = calculateAndRedirect(context, newContext, user, dateDebut, dateFin, settings)
            )
          ],
        );
      }
  );
}

List<String> listeProg(user) {
  List<String> liste = [];
  for (var i = 0; i < user.course.length; i++) {
    liste.add("Exos : " + user.prog[i].prog_exo.toString() + "% et théorie : " + user.prog[i].prog_exo.toString() + "%");
  }
  return liste;
}

timeOfDay(String time) {
  List<String> timeToList = time.split(":");
  int minInDay = 60*int.parse(timeToList[0]) + int.parse(timeToList[1]);
  return minInDay;
}

DateTime toDateTime(String date) {
  return DateTime.parse(date);
}

TimeOfDay toToD(String time) {
  List<String> timeToList = time.split(":");
  TimeOfDay ToD = TimeOfDay(hour: int.parse(timeToList[0]), minute: int.parse(timeToList[1]));
  return ToD;
}