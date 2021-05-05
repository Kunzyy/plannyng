import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:plannyng/database_helper.dart';

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
    return new FutureBuilder(
      future: _checkIsConnected(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          idLoggedIn = snapshot.data;
          return MaterialApp(
              title: "Plannyng",
              home: Home(),
              theme: appTheme);
        }else{
          return MaterialApp(
              title: "Plannyng",
              home: Login(wantDisconnect: 0),
              theme: appTheme);
        }
      });
  }

  Future<void> _checkIsConnected() async {
    final dbHelper = DatabaseHelper.instance;
    return await dbHelper.checkSomeoneIsConnected();
  }
}

