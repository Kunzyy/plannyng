import 'package:flutter/material.dart';
import 'package:plannyng/Screens/waitPlanSess.dart';
import 'package:plannyng/main.dart';

import 'package:plannyng/functionsWidgets.dart';

import '../Constants.dart';

class PlanSessSettings extends StatefulWidget {
  @override
  _PlanSessSettingsState createState() => _PlanSessSettingsState();
}

class _PlanSessSettingsState extends State<PlanSessSettings> {
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  createCardPlanSess(cardForm[0]),
                  createFormCase(etiquettesForm[0], 0, MediaQuery.of(context).size.width),
                  createCardPlanSess(cardForm[1]),
                  createFormCase(etiquettesForm[1], 2, MediaQuery.of(context).size.width, etiquettesForm[2], 2),
                  createCardPlanSess(cardForm[2]),
                  createFormCase(etiquettesForm[3], 0, MediaQuery.of(context).size.width, etiquettesForm[4], 0),
                  createCardPlanSess(cardForm[3]),
                  createFormCase(etiquettesForm[5], 2, MediaQuery.of(context).size.width, etiquettesForm[6], 2),
                  Padding(
                    padding: paddingCard,
                    child: ElevatedButton(
                      onPressed: () => redirect(context, WaitPlanSess(), true),
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
    );}

}


