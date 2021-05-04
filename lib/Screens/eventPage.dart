import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:plannyng/Constants.dart';
import 'package:plannyng/classes.dart';

class EventPage extends StatelessWidget {
  Block appointment;

  EventPage({this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page de l'évènement"),
        backgroundColor: primaryColor,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: backgroundDeco,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text("Nom du cours", style: titreCard),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(appointment.course.name, style: listeCard),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text("Heure de début", style: titreCard),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(DateFormat('yyyy-MM-dd – kk:mm').format(appointment.start), style: listeCard),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "Heure de fin",
                style: titreCard,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(DateFormat('yyyy-MM-dd – kk:mm').format(appointment.finish), style: listeCard),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "Couleur de fond",
                style: titreCard,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                color: appointment.background,
                width: 48.0,
                height: 48.0,
              ),
            ),
            Text("Vous voulez changer la couleur ?"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: <Widget>[
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
                            ),
                            onPressed: () {},
                            child: Text("Je veux celle-ci!!!"),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  secondaryColor),
                            ),
                            onPressed: () {},
                            child: Text("Je veux celle-ci!!!"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(accentColor),
                            ),
                            onPressed: () {},
                            child: Text("Je veux celle-ci!!!"),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(otherColor),
                            ),
                            onPressed: () {},
                            child: Text("Je veux celle-ci!!!"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
