import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Toutes les couleurs utilisées

const primaryColor = Color(0xff6DD7C8);
const secondaryColor = Color(0xffD76D7C);
const accentColor = Color(0xffB1D76D);
const otherColor = Color(0xff936DD7);

const testcolor = 0xff64F5AD;
const testColor = Color(testcolor);

// Paramètres Opti

int heureJourOpti = 10;
String heureDebutOpti = '08:00';
String heureFinOpti = '20:00';
int nombrePausesOptiAM = 2;
int dureePausesOptiAM = 10;
int nombrePausesOptiPM = 2;
int dureePausesOptiPM = 10;

String heureDebutLunchOpti = '12:30';
String heureFinLunchOpti = '13:30';

// Tous les textes utilisés

const nomApp = "Plannyng";

const formMail = "Email";
const formErrorMail = "Veuillez insérer votre email";
const formMDP = "Mot de passe";
const formErrorMDP = "Veuillez insérer votre mot de passe";
const formValMDP = "Vérification de votre mot de passe";
const formDiffMDP = "Les mots de passe ne correspondent pas";
const formErrorValMDP = "Mot de passe erroné";
const formNom = "Nom";
const formErrorNom = "Veuillez insérer votre nom";

const buttonEditProfile = "Modifier mon profil";

const cancelAllNotifText = "Supprimez les notifications à venir";

// Tous les styles de texte utilisés

var titreStyle = GoogleFonts.roboto();

var titreEvent = GoogleFonts.roboto();

var titreButton = GoogleFonts.roboto(
    fontSize: 17.0
);

var titreDrawer = GoogleFonts.roboto(
    fontSize: 25.0
);

var titreCard = GoogleFonts.roboto(
  fontSize: 25.0,
);

var titreCard2 = GoogleFonts.roboto(
  fontSize: 20.0,
  color: Colors.white
);

var listeCard = GoogleFonts.roboto(
  fontSize: 15.0,
);

var listeCard2 = GoogleFonts.roboto(
    fontSize: 15.0,
    color: Colors.white
);


// Mise en page

const backgroundDeco = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/background/test.jpg'),
    fit: BoxFit.cover,
  ),
);

const paddingCard = EdgeInsets.all(8.0);
const largePadding = EdgeInsets.all(30.0);

double widthForm(context) {
  return 2*((MediaQuery.of(context).size.width - 20.0) / 3) ;
}
double widthText(context) {
  return ((MediaQuery.of(context).size.width - 20.0) / 3) ;
}


var appTheme = ThemeData(
  primaryColor: primaryColor,
  accentColor: accentColor,
  highlightColor: accentColor,
  buttonColor: secondaryColor,
  textTheme: TextTheme(
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: titreButton,
      minimumSize: Size(180,60),
      primary: secondaryColor,
    )
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColor,
    elevation: 0.0,
    textTheme: TextTheme(
      headline6: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 25.0,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    )
  ),
);

var largeurForm = 100.0;

// Autres

final kFirstDay = DateTime.utc(2015, 01, 01);
final kLastDay = DateTime.utc(2040, 12, 31);

const listeDrawer = ["Accueil", "Mon Profil", "Planifier une session","Déconnexion"];

var listeCours = ["Analyse 2", "Algèbre 2", "Mecara Q2", "Physique Q2", "Chimie Orga", "Info", "Envi", "Ecopol", "Anglais"];
var heuresCoursTheory = [14, 10, 14, 14, 14, 3, 5, 5, 5];
var heuresCoursExo= [14, 10, 6, 14, 7, 2, 2, 0, 0];
var repartCours = [50, 50, 30, 50, 65, 50, 67, 100, 100];
var couleurCours = [
  0xff6DD7C8,
  0xffD76D7C,
  0xffB1D76D,
  0xff936DD7,
  0xff64F5AD,
  0xffEFB0F7,
  0xffC73080,
  0xffC0F564,
  0xffE63959
  // 0xff56BCDB.toString() pas utilisée
];

var valeursProfil = ["Agathe Moineau", "Umons", "Faculté Polytechnique de Mons", "Ingénieur civil orientation générale", "BA1" ];
var etiquettesProfil = ["Etablissement", "Faculté", "Cursus", "Année d'étude"];

var etiquettesForm = ["Nombre d'heures de travail par jour", "Heure de début de la journée", "Heure de fin de la journée", "Nombre de pauses", "Durée des pauses", "Début de la pause de midi", "Fin de la pause de midi"];
var cardForm = ["Durée de l'étude", "Horaire d'étude", "Pauses du matin", "Pause de l'après-midi", "Pause de midi"];

//Variables de session
var idLoggedIn; //Valeur par défaut : null