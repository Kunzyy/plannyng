import 'package:flutter/material.dart';

import 'package:plannyng/Components/drawerComponent.dart';
import 'package:plannyng/Screens/editProfile.dart';

import '../Constants.dart';
import 'package:plannyng/database.dart';
import 'package:plannyng/main.dart';
import 'package:plannyng/classes.dart';


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    User user = getUser();
    print(user.name);


    List<List> listes = getUser().listeStrings();

    List<Widget> createCard(String titre, List<String> listeEtiquette, List<String> listeValeur1, [List<String> listeValeur2, List<String> listeValeur3]) {
      List<Widget> listeWidget = [];

      listeWidget.add(Padding(
          padding: paddingCard,
          child: Text(titre,
            style: titreCard,
          )
      ));

      for (var i = 0; i < listeEtiquette.length; i++) {
        String texte = listeEtiquette[i] + " : " + listeValeur1[i];
        if (listeValeur2 != null) {
          texte += (" ( " + listeValeur2[i]);
          if (listeValeur3 != null) {
            texte += (" " + listeValeur3[i]);
          }
          else {
            texte += " )";
          }
        }
        var tmp = Padding(
            padding: paddingCard,
            child: Text(texte,
              style: listeCard,
            )
        );
        
        listeWidget.add(tmp);
      }
      return listeWidget;
    }

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
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: createCard(valeursProfil[0], etiquettesProfil, valeursProfil.sublist(1)),
                )
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: createCard("Mes cours", listeCours, listes[0]),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: ElevatedButton(onPressed: () => redirect(context, EditProfile()),
                    child: Text(buttonEditProfile)),
              ),
            )
          ],

        ),


      ),
    );
  }
}
