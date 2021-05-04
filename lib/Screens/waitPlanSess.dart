import 'package:flutter/material.dart';
import 'package:plannyng/Screens/plannSess.dart';
import 'plannSessSettings.dart';

class WaitPlanSess extends StatefulWidget {
  @override
  _WaitPlanSessState createState() => _WaitPlanSessState();
}

class _WaitPlanSessState extends State<WaitPlanSess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
            "Planifier une session"
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Text(dateDebut),
            Text(dateFin),
            Text(heureJour.toString()),
            Text(heureDebut),
            Text(heureFin),
            Text(nombrePauses.toString()),
            Text(dureePauses.toString()),
            Text(heureDebutLunch),
            Text(heureFinLunch),
          ],
        ),
      ),
    );
  }
}
