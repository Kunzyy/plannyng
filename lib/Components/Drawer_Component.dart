import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              children: [
                ListTile(
                  title: Text("Accueil",
                    style: TextStyle(
                        fontSize: 35.0),
                  ),
                ),
                ListTile(
                  title: Text("Profil",
                    style: TextStyle(
                        fontSize: 35.0),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
