import 'package:flutter/material.dart';

import 'package:plannyng/Constants.dart';

class DrawerComponent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Widget> listTiles = [];

    for (var i = 0; i < listeDrawer.length ; i ++) {
      var tmp = ListTile(
        title: Text(listeDrawer[i],
          style: titreDrawer,
        )
      );
      listTiles.add(tmp);
    }

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Container(
              child : Text("Nom de l'utilisateur")
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
