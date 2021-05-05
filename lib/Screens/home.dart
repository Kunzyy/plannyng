import 'package:flutter/material.dart';

import 'package:plannyng/Components/calendarComponent.dart';
import 'package:plannyng/Components/drawerComponent.dart';

import 'package:plannyng/database_helper.dart';

import '../Constants.dart';
import 'package:plannyng/classes.dart';

class Home extends StatefulWidget {
  User user;
  Home({ @required this.user, Key key,}) : super(key:key);

  @override
  _HomeState createState() => _HomeState(user);
}

class _HomeState extends State<Home> {
  final dbHelper = DatabaseHelper.instance;
  User user;
  _HomeState(this.user);

  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
        future: _getUser(idLoggedIn),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            user = snapshot.data;
            return Container(
                constraints: BoxConstraints.expand(),
                decoration: backgroundDeco,
                child: Container(
                  width: MediaQuery.of(context).size.width - 40.0,
                  height: MediaQuery.of(context).size.height - 40.0,
                  child: CalendarComponent(user: user)
                ),
            );
          }else{
            return new Center(
              child: Text("Error, couldn't get user")
              );
          }
        });

    return Scaffold(
      drawer: DrawerComponent(user: user),
      appBar: AppBar(
          title: Text(
              "Mon plannyng"
          ),
          backgroundColor: primaryColor,
          elevation: 0.0
      ),
      body: futureBuilder
    );
  }

  Future<User> _getUser(int id) async {
    if (user != User("", "", [])) {
      return user;
    }
    else{
      return await dbHelper.getUser(id);
    }
  }
}


