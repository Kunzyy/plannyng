import 'package:flutter/material.dart';

import 'package:plannyng/Components/calendarComponent.dart';
import 'package:plannyng/Components/drawerComponent.dart';

import '../Constants.dart';
import 'package:plannyng/classes.dart';

class Home extends StatefulWidget {
  User user;
  Home({ @required this.user, Key key,}) : super(key:key);

  @override
  _HomeState createState() => _HomeState(user);
}

class _HomeState extends State<Home> {

  User user;
  _HomeState(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(user:user),
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
          child: CalendarComponent(user: user,),
        ),
      ),
    );
  }
}
