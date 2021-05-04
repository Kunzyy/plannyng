import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'Screens/home.dart';
import 'Screens/login.dart';
import 'package:plannyng/Constants.dart';

bool connected = true;



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


