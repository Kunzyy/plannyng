import 'package:flutter/material.dart';

import 'package:plannyng/Constants.dart';

class DrawerComponent extends StatelessWidget {

  redirect(context, newContext) {
    dynamic newRoute = MaterialPageRoute(builder: (context) => newContext);
    Navigator.pushReplacement(context, newRoute);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listTiles = [];

    for (var i = 0; i < listeDrawer.length ; i ++) {
      var tmp = ListTile(
        title: Text(listeDrawer[i],
          style: titreDrawer,
        ),
        onTap: () => redirect(context, listeRedirection[i]),
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
