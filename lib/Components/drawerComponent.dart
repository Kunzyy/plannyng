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
    var listeRedirection = [Home(), Profile(user:user), PlanSess(user:user),Login(wantDisconnect: 1)];

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
            child: Padding(
              padding: paddingCard,
              child: Card(
                color: secondaryColor,
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 250.0,
                    height: 75.0,
                    child: ListView(
                      children : [
                        Center(child: Text(valeursProfil[0], style: titreCard2,)),
                        Center(child: Text(valeursProfil[2], style: listeCard2,)),
                        Center(child: Text(valeursProfil[3], style: listeCard2,)),
                        Center(child: Text(valeursProfil[4], style: listeCard2,)),
                      ],
                    ),
                  ),
                ),
              ),
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
