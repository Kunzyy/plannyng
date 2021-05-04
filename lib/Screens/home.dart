import 'package:flutter/material.dart';

import 'package:plannyng/Components/calendarComponent.dart';
import 'package:plannyng/Components/drawerComponent.dart';

import '../Constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
      appBar: AppBar(
          title: Text(
              "Mon plannyng"
          ),
          backgroundColor: primaryColor,
          elevation: 0.0
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: backgroundDeco,
        child: Container(
          width: MediaQuery.of(context).size.width - 40.0,
          height: MediaQuery.of(context).size.height - 40.0,
          child: CalendarComponent(),
        ),
      ),
    );
  }
}
