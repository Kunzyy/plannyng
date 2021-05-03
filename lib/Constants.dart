import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:plannyng/Screens/home.dart';
import 'package:plannyng/Screens/login.dart';
import 'package:plannyng/Screens/plannSess.dart';
import 'package:plannyng/Screens/profile.dart';

// Toutes les couleurs utilisées

const primaryColor = Color(0xff6DD7C8);
const secondaryColor = Color(0xffD76D7C);
const accentColor = Color(0xffB1D76D);
const otherColor = Color(0xff936DD7);

// Police utilisée


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

var listeCard = GoogleFonts.roboto(
  fontSize: 15.0,

);

// Mise en page

const backgroundDeco = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/background/test.jpg'),
    fit: BoxFit.cover,
  ),
);

const paddingCard = EdgeInsets.all(8.0);

var appTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: secondaryColor,
      textStyle: titreButton,
      minimumSize: Size(150,50),
    )
  )
);

// Autres

final kFirstDay = DateTime.utc(2015, 01, 01);
final kLastDay = DateTime.utc(2040, 12, 31);

const listeDrawer = ["Accueil", "Mon Profil", "Planifier une session", "Déconnexion"];
var listeRedirection = [Home(), Profile(), PlanSess(), Login()];

var listeCours = ["Analyse 2", "Algèbre 2", "Mecara Q2", "Physique Q2", "Chimie Orga", "Info", "Envi", "Ecopol", "Anglais"];
var heuresCoursTheory = [14, 10, 14, 14, 14, 3, 5, 5, 5];
var heuresCoursExo= [14, 10, 6, 14, 7, 2, 2, 0, 0];
var repartCours = [50, 50, 30, 50, 65, 50, 67, 100, 100];

var valeursProfil = ["Agathe Moineau", "Umons", "Faculté Polytechnique de Mons", "Ingénieur civil orientation générale", "BA1" ];
var etiquettesProfil = ["Etablissement", "Faculté", "Cursus", "Année d'étude"];

//Variables de session
var idLoggedIn;