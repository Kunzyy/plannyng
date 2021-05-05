import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

import 'package:plannyng/Components/drawerComponent.dart';
import 'package:plannyng/Screens/plannSessSettings.dart';
import 'package:plannyng/functionsWidgets.dart';
import 'package:plannyng/classes.dart';

import 'home.dart';
import '../Constants.dart';

String dateDebut = null;
String dateFin = null;

class PlanSess extends StatefulWidget {
  User user;
  PlanSess({ @required this.user, Key key,}) : super(key:key);

  @override
  _PlanSessState createState() => _PlanSessState(user);
}

class _PlanSessState extends State<PlanSess> {
  final _formDatesKey = GlobalKey<FormState>();

  User user;
  _PlanSessState(this.user);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: DrawerComponent(user : user),
      appBar: AppBar(
        title: Text(
            "Planifier une session"
        ),
      ),

      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: backgroundDeco,
        child: Form(
          key: _formDatesKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Padding(
                  padding: paddingCard,
                  child: Card(
                    child: Padding(
                      padding: largePadding,
                      child: Text("Sélection de la période de blocus",
                        style: titreCard,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: largePadding,
                  child: Text("Date de début du blocus",
                    style: titreButton,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.0, right:50.0),
                  child: DateTimePicker(
                    type: DateTimePickerType.date,
                    firstDate: kFirstDay,
                    lastDate: kLastDay,
                    initialDate: DateTime.now(),
                    onChanged: (val) => setState(() {dateDebut = val;}),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veuillez remplir ce champ";
                      }
                      else if(DateTime.parse(val).compareTo(DateTime.now()) < 0) {
                        return "Cette date est déjà passée";
                      }
                      else if(DateTime.parse(val).compareTo(DateTime.parse(dateFin)) > 0) {
                        return 'La date de début doit être antérieure à celle de fin';
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: largePadding,
                  child: Text("Date de fin du blocus",
                    style: titreButton,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.0, right:50.0),
                  child: DateTimePicker(
                    type: DateTimePickerType.date,
                    firstDate: kFirstDay,
                    lastDate: kLastDay,
                    initialDate: DateTime.now(),
                    onChanged: (val) => setState(() {dateFin = val;}),
                    cursorColor: primaryColor,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veuillez remplir ce champ";
                      }
                      else if(DateTime.parse(val).compareTo(DateTime.now()) < 0) {
                        return "Cette date est déjà passée";
                      }
                      else if(DateTime.parse(val).compareTo(DateTime.parse(dateDebut)) < 0) {
                        return 'La date de début doit être postérieure à celle de début';
                      }
                      else {
                        return null;
                      }
                    },

                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.0, top: 30.0, right:50.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formDatesKey.currentState.validate()) {
                        print("test1");
                        confirmPlan(context, Home(user:user), user, toDateTime(dateDebut), toDateTime(dateFin), heureJourOpti, heureDebutOpti, heureFinOpti, nombrePausesOptiAM, dureePausesOptiAM, nombrePausesOptiPM, dureePausesOptiPM, heureDebutLunchOpti, heureFinLunchOpti);
                      }
                    },
                    child: Text("Planning optimisé",
                      style: titreButton,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.0, top: 15.0, right:50.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formDatesKey.currentState.validate()) {
                        redirect(context, PlanSessSettings(user: user), false);
                      }
                    },
                    child: Text("Planning personnalisé",
                      style: titreButton,
                    ),
                  ),
                ),

              ],

            ),
          ),
        ),


      ),
    );}

}


