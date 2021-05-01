import 'package:flutter/material.dart';

import 'package:plannyng/Components/drawerComponent.dart';

import '../Constants.dart';


class PlanSess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
      appBar: AppBar(
          title: Text(
              "Planifier une session"
          ),
          backgroundColor: primaryColor,
          elevation: 0.0
      ),

      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: backgroundDeco,


      ),
    );  }
}


