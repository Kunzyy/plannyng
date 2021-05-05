import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'plannSess.dart';

import 'package:plannyng/functionsWidgets.dart';

import '../Constants.dart';
import 'package:plannyng/classes.dart';
import 'package:plannyng/Screens/home.dart';

int heureJour = 0;
String heureDebut = "00:00";
String heureFin = "24:00";
int nombrePauses = 0;
int dureePauses = 0;
String heureDebutLunch = "00:00";
String heureFinLunch = "24:00";


class PlanSessSettings extends StatefulWidget {
  User user;
  PlanSessSettings({ @required this.user, Key key,}) : super(key:key);

  @override
  _PlanSessSettingsState createState() => _PlanSessSettingsState(user);
}

class _PlanSessSettingsState extends State<PlanSessSettings> {
  final _formSettingsKey = GlobalKey<FormState>();

  User user;
  _PlanSessSettingsState(this.user);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Planifier une session - Paramètres"
        ),
      ),

      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: backgroundDeco,
        child: Center(
          child: Form(
            key: _formSettingsKey,
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: [
                    createCardPlanSess(cardForm[0]),
                    Center(
                      child: Padding(
                        padding: largePadding,
                        child: Row(
                          children: [
                            Container(
                              child: Text(etiquettesForm[0]),
                              width: widthText,
                            ),
                            Container(
                              width: widthForm,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  errorMaxLines: 2,
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (val) => setState(() {heureJour = int.parse(val);}),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Veuillez remplir ce champ";
                                  }
                                  else if(int.tryParse(val) == null) {
                                    return "Veuillez entrer un nombre entier";
                                  }
                                  else if (int.parse(val) <= 0 || int.parse(val) >= 24) {
                                    return "Cette valeur n'est pas valide, veuillez entrer une valeur entre 1 et 24";
                                  }
                                  else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    createCardPlanSess(cardForm[1]),
                    Center(
                      child: Padding(
                        padding: largePadding,
                        child: Row(
                          children: [
                            Container(
                              child: Text(etiquettesForm[1]),
                              width: widthText,
                            ),
                            Container(
                              width: widthForm,
                              child: DateTimePicker(
                                decoration: InputDecoration(
                                  errorMaxLines: 2,
                                ),
                                type: DateTimePickerType.time,
                                onChanged: (val) => setState(() {heureDebut = val;}),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Veuillez remplir ce champ";
                                  }
                                  else if(timeOfDay(val) > timeOfDay(heureFin)) {
                                    return "L'heure de début doit être avant l'heure de fin";
                                  }
                                  else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: largePadding,
                        child: Row(
                          children: [
                            Container(
                              child: Text(etiquettesForm[2]),
                              width: widthText,
                            ),
                            Container(
                              width: widthForm,
                              child: DateTimePicker(
                                decoration: InputDecoration(
                                  errorMaxLines: 2,
                                ),
                                type: DateTimePickerType.time,
                                onChanged: (val) => setState(() {heureFin = val;}),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Veuillez remplir ce champ";
                                  }
                                  else if(timeOfDay(val) < timeOfDay(heureDebut)) {
                                    return "L'heure de fin doit être après l'heure de début";
                                  }
                                  else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    createCardPlanSess(cardForm[2]),
                    Center(
                      child: Padding(
                        padding: largePadding,
                        child: Row(
                          children: [
                            Container(
                              child: Text(etiquettesForm[3]),
                              width: widthText,
                            ),
                            Container(
                              width: widthForm,

                              child: TextFormField(
                                decoration: InputDecoration(
                                  errorMaxLines: 2,
                                ),

                                keyboardType: TextInputType.number,
                                onChanged: (val) => setState(() {nombrePauses = int.parse(val);}),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Veuillez remplir ce champ";
                                  }
                                  else if(int.tryParse(val) == null) {
                                    return "Veuillez entrer un nombre entier";
                                  }
                                  else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: largePadding,
                        child: Row(
                          children: [
                            Container(
                              child: Text(etiquettesForm[4]),
                              width: widthText,
                            ),
                            Container(
                              width: widthForm,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  errorMaxLines: 2,
                                ),

                                keyboardType: TextInputType.number,
                                onChanged: (val) => setState(() {dureePauses = int.parse(val);}),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Veuillez remplir ce champ";
                                  }
                                  else if(int.tryParse(val) == null) {
                                    return "Veuillez entrer un nombre entier";
                                  }
                                  else {
                                    return null;
                                  }
                                },

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    createCardPlanSess(cardForm[3]),
                    Center(
                      child: Padding(
                        padding: largePadding,
                        child: Row(
                          children: [
                            Container(
                              width: widthText,
                              child: Text(etiquettesForm[5]),
                            ),
                            Container(
                              width: widthForm,
                              child: DateTimePicker(
                                decoration: InputDecoration(
                                  errorMaxLines: 2,
                                ),

                                type: DateTimePickerType.time,
                                onChanged: (val) => setState(() {heureDebutLunch = val;}),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Veuillez remplir ce champ";
                                  }
                                  else if(timeOfDay(val) > timeOfDay(heureFinLunch)) {
                                    return "L'heure de début de la pause de midi doit être avant l'heure de fin";
                                  }
                                  else if(timeOfDay(val) > timeOfDay(heureFin) || timeOfDay(val) < timeOfDay(heureDebut) ) {
                                    return "La pause de midi doit être comprise dans la période d'étude";
                                  }
                                  else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: largePadding,
                        child: Row(
                          children: [
                            Container(
                              width: widthText,
                              child: Text(etiquettesForm[6]),
                            ),
                            Container(
                              width: widthForm,
                              child: DateTimePicker(
                                decoration: InputDecoration(
                                  errorMaxLines: 2,
                                ),

                                type: DateTimePickerType.time,
                                onChanged: (val) => setState(() {heureFinLunch = val;}),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Veuillez remplir ce champ";
                                  }
                                  else if(timeOfDay(val) < timeOfDay(heureDebutLunch)) {
                                    return "L'heure de fin de la pause de midi doit être avant l'heure de début";
                                  }
                                  else if(timeOfDay(val) > timeOfDay(heureFin) || timeOfDay(val) < timeOfDay(heureDebut) ) {
                                    return "La pause de midi doit être comprise dans la période d'étude";
                                  }
                                  else {
                                    return null;
                                  }
                                },

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: paddingCard,
                      child: ElevatedButton(
                        onPressed: () {
                          print(timeOfDay(heureFin).toString());

                          if (_formSettingsKey.currentState.validate()) {
                            confirmPlan(context, Home(), user,toDateTime(dateDebut), toDateTime(dateFin), heureJour, heureDebut, heureFin, nombrePauses, dureePauses, heureDebutLunch, heureFinLunch);
                          }
                        },
                        child: Text("Valider les paramètres",
                          style: titreButton,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );}

}


