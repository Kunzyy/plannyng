import 'package:flutter/material.dart';

import 'package:plannyng/Components/drawerComponent.dart';
import 'package:plannyng/Screens/editProfile.dart';

import 'package:plannyng/database.dart';
import 'package:plannyng/classes.dart';
import 'package:plannyng/functionsWidgets.dart';

import '../Constants.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    User user = getUser();
    print(user.name);

    List<List> listes = getUser().listeStrings();

    return Scaffold(
      drawer: DrawerComponent(),
      appBar: AppBar(
          title: Text(
              "Mon profil"
          ),
          backgroundColor: primaryColor,
          elevation: 0.0
      ),

      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: backgroundDeco,
        child: ListView(
          children: [
            Card(
              child: Padding(
                  padding: paddingCard,
                  child: Column(
                    children: createCard(valeursProfil[0], etiquettesProfil, valeursProfil.sublist(1)),
                  )
              ),
            ),
            Card(
              child: Padding(
                padding: paddingCard,
                child: Column(
                  children: createCard("Mes cours", listeCours, listes[0]),
                ),
              ),
            ),
            Padding(
              padding: paddingCard,
              child: Center(
                child: ElevatedButton(onPressed: () => redirect(context, EditProfile(), false),
                    child: Text(buttonEditProfile)),
              ),
            )
          ],

        ),


      ),
    );
  }
}
