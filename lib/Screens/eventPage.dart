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
        child: SingleChildScrollView(
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
                child: Text(
                    DateFormat('yyyy-MM-dd – kk:mm').format(appointment.start),
                    style: listeCard),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(primaryColor),
                ),
                onPressed: () {},
                child: Text("Je veux changer l'heure de début !"),
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
                child: Text(
                    DateFormat('yyyy-MM-dd – kk:mm').format(appointment.finish),
                    style: listeCard),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(primaryColor),
                ),
                onPressed: () {},
                child: Text("Je veux changer l'heure de fin !"),
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
              Text("Vous voulez changer la couleur ?", style: listeCard),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  child: DropdownButton<Color>(
                    hint: Text('Sélectionnez une couleur'),
                    items: <Color>[
                      primaryColor,
                      secondaryColor,
                      accentColor,
                      otherColor
                    ].map((Color value) {
                      //La fonction crée un objet qui aura la même valeur et le même texte, à partir du tableau d'objet
                      return new DropdownMenuItem<Color>(
                        value: value,
                        child: Center(
                          child: new ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(value),
                            ),
                            onPressed: () {},
                            child: Text("Je veux celle-ci !!!"),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
