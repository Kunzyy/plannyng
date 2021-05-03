import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'Screens/home.dart';
import 'Screens/login.dart';
import 'package:plannyng/Constants.dart';
import 'classes.dart';

bool connected = true;

redirect(context, newContext, [bool replacement]) {
  dynamic newRoute = MaterialPageRoute(builder: (context) => newContext);
  if (replacement == false) {
    Navigator.push(context, newRoute);
  }
  else {
    Navigator.pushReplacement(context, newRoute);
  }
}

void main() {
  initializeDateFormatting().then((_) => runApp(Plannyng()));
}


class Plannyng extends StatefulWidget {
  @override
  _PlannyngState createState() => _PlannyngState();
}

class _PlannyngState extends State<Plannyng> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Plannyng",
        home: connected == true ? Home() : Login(),
        theme: appTheme,
    );
  }
}


