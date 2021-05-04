import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

import 'package:plannyng/Constants.dart';

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

calculateAndRedirect(context, newContext, dateDebut, dateFin, heureJour, heureDebut, heureFin, nombrePauses, dureePauses, heureDebutLunch, heureFinLunch, [bool replacement]) {
  // Calcul du planning
  print(dateDebut);
  print(dateFin);
  print(heureJour);
  print(heureDebut);
  print(heureFin);
  print(nombrePauses);
  print(dureePauses);
  print(heureDebutLunch);
  print(heureFinLunch);

  // Actualisation du Home
  redirect(context, newContext, true);
}

Future<void> confirmPlan(context, newContext, dateDebut, dateFin, heureJour, heureDebut, heureFin, nombrePauses, dureePauses, heureDebutLunch, heureFinLunch) async {
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
            onPressed: () => calculateAndRedirect(context, newContext, dateDebut, dateFin, heureJour, heureDebut, heureFin, nombrePauses, dureePauses, heureDebutLunch, heureFinLunch,),
          )
        ],
      );
    }
  );
}

timeOfDay(String time) {
  List<String> timeToList = time.split(":");
  int minInDay = 60*int.parse(timeToList[0]) + int.parse(timeToList[1]);
  return minInDay;
}