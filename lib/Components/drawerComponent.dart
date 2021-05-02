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
