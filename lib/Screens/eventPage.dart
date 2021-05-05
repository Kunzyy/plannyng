import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:plannyng/Constants.dart';
import 'package:plannyng/classes.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventPage extends StatefulWidget {
  Block appointment;
  EventPage({ @required this.appointment, Key key1,}) : super(key:key1);

  @override
  _EventPage createState() => _EventPage(appointment);
}

class _EventPage extends State<EventPage> {
  Block appointment;

  _EventPage(this.appointment);

  void changeColor(Color color) => setState(() => appointment.course.backgroundColor = color);

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
                  color: appointment.course.backgroundColor,
                  width: 48.0,
                  height: 48.0,
                ),
              ),
              Text("Vous voulez changer la couleur ?", style: listeCard),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  child: new ElevatedButton(
                    child: const Text(
                      'Change moi !',
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(appointment.course.backgroundColor),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Select a color'),
                            content: SingleChildScrollView(
                              child: BlockPicker(
                                pickerColor: appointment.course.backgroundColor,
                                onColorChanged: changeColor,
                              ),
                            ),
                          );
                        },
                      );
                    },
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
