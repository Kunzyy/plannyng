import 'package:flutter/material.dart';

import 'package:plannyng/Constants.dart';
import 'package:plannyng/functionsWidgets.dart';
import 'package:plannyng/classes.dart';

import 'package:plannyng/Screens/home.dart';
import 'package:plannyng/Screens/profile.dart';
import 'package:plannyng/Screens/plannSess.dart';
import 'package:plannyng/Screens/login.dart';


class DrawerComponent extends StatelessWidget {
  User user;
  DrawerComponent({ @required this.user, Key key,}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    List<Widget> listTiles = [];
    var listeRedirection = [Home(user:user), Profile(user:user), PlanSess(user:user), Login()];

    for (var i = 0; i < listeDrawer.length ; i ++) {
      var tmp = ListTile(
        title: Text(listeDrawer[i],
          style: titreDrawer,
        ),
        onTap: () => redirect(context, listeRedirection[i], true),
      );
      listTiles.add(tmp);
    }

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: ListView(
              children : [
                Text(valeursProfil[0]),
                Text(valeursProfil[2]),
                Text(valeursProfil[3]),
                Text(valeursProfil[4]),

              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: listTiles,
            ),
          )
        ],
      ),
    );
  }
}
