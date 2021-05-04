import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

import 'package:plannyng/Components/drawerComponent.dart';
import 'package:plannyng/Screens/plannSessSettings.dart';
import 'package:plannyng/functionsWidgets.dart';

import '../Constants.dart';

String dateDebut = null;
String dateFin = null;

class PlanSess extends StatefulWidget {
  @override
  _PlanSessState createState() => _PlanSessState();
}

class _PlanSessState extends State<PlanSess> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: DrawerComponent(),
      appBar: AppBar(
          title: Text(
              "Planifier une session"
          ),
      ),

      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: backgroundDeco,
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                  padding: paddingCard,
                  child: DateTimePicker(
                    type: DateTimePickerType.date,
                    firstDate: kFirstDay,
                    lastDate: kLastDay,
                    initialDate: DateTime.now(),
                    onChanged: (val) => dateDebut = val,
                  ),
                ),
                Padding(
                  padding: largePadding,
                  child: Text("Date de fin du blocus",
                    style: titreButton,
                  ),
                ),
                Padding(
                  padding: paddingCard,
                  child: DateTimePicker(
                    type: DateTimePickerType.date,
                    firstDate: kFirstDay,
                    lastDate: kLastDay,
                    initialDate: DateTime.now(),
                    onChanged: (val) => dateFin = val,
                    cursorColor: primaryColor,
                  ),
                ),
                Padding(
                  padding: paddingCard,
                  child: ElevatedButton(
                    onPressed: () => redirect(context, PlanSessSettings(), false),
                    child: Text("Valider les dates",
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


