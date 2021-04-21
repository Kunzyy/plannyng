import 'package:flutter/material.dart';

import 'Screens/home.dart';
import 'Screens/login.dart';

void main() => runApp(Plannyng());

bool connected = true;

class Plannyng extends StatefulWidget {
  @override
  _PlannyngState createState() => _PlannyngState();
}

class _PlannyngState extends State<Plannyng> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Plannyng",
        home: connected == true ? Home() : Login()
    );
  }
}
