import 'package:flutter/material.dart';

import 'package:plannyng/Components/drawerComponent.dart';
import 'package:plannyng/Screens/editProfile.dart';
import 'package:plannyng/main.dart';

import 'package:plannyng/database.dart';
import 'package:plannyng/classes.dart';
import 'package:plannyng/functionsWidgets.dart';

import '../Constants.dart';

class Profile extends StatelessWidget {
  User user;
  Profile({ @required this.user, Key key,}) : super(key:key);

  @override
  Widget build(BuildContext context) {

    List<List> listes = user.listeStrings();
    user.progUpdate();

    return Scaffold(
      drawer: DrawerComponent(user: user),
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
            SizedBox(
              height: MediaQuery.of(context).size.height / 14,
            ),
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
            // Card(
            //   child: Padding(
            //     padding: paddingCard,
            //     child: Column(
            //       children: createCard("Ma progression", listeCours, listeProg(user)),
            //     ),
            //   ),
            // ),

            Padding(
              padding: paddingCard,
              child: Center(
                child: ElevatedButton(onPressed: () => {},
                    child: Text(buttonEditProfile)),
              ),
              // child: ElevatedButton(onPressed: () => redirect(context, EditProfile(), false),
              //       child: Text(buttonEditProfile)),
              // ),
            ),

          ],

        ),


      ),
    );
  }
}
