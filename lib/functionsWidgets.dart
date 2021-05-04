import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

import 'package:plannyng/Constants.dart';

createCardPlanSess(String texte) {
  return Padding(
    padding: paddingCard,
    child: Card(
      child: Padding(
        padding: paddingCard,
        child: Text(texte,
          style: titreButton,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

createFormCase(String etiquette, int type, double widthEcran, [String etiquette2 = '', int type2]) {
  List<Widget> row = [];
  double widthEtiquette = (widthEcran/4) + 5.0;
  double widthForm = (widthEcran/4) - 50.0;

  row.add(Container(
    child: Text(etiquette),
    width: widthEtiquette,
  ));

  // Si texte numérique ou alphabétique
  if (type != 2) {
    TextInputType textInputType = TextInputType.text;
    if(type == 0) {
      TextInputType textInputType = TextInputType.number;
    }

    row.add(Container(
      width: widthForm,
      child: TextFormField(
        keyboardType: textInputType,
      ),


    ));
  }

  // Si heure
  else {
    row.add(Container(
      width: widthForm,
      child: DateTimePicker(
        type: DateTimePickerType.time,
      ),
    ));
  }

  if (etiquette2 != '') {
    row.add(Container(
      width: widthEtiquette,
      child: Text(etiquette2),
    ));

    if (type2 != 2) {
      TextInputType textInputType = TextInputType.text;
      if(type2 == 0) {
        TextInputType textInputType = TextInputType.number;
      }

      row.add(Container(
        width: widthForm,
        child: TextFormField(
          keyboardType: textInputType,
        ),


      ));
    }
    // Si heure
    else if (type2 == 2) {
      row.add(Container(
        width: widthForm,
        child: DateTimePicker(
          type: DateTimePickerType.time,
        ),
      ));
    }
  }
  return Center(
    child: Padding(
      padding: largePadding,
      child: Row(
        children: row,
      ),
    ),
  );
}

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
