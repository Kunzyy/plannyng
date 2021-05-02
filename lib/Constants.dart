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
const formErrorValMDP = "Mot de passe erroné";
const formNom = "Nom";
const formErrorNom = "Veuillez insérer votre nom";

// Tous les styles de texte utilisés

var titreStyle = GoogleFonts.roboto();

var titreEvent = GoogleFonts.roboto();

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

// Autres

final kFirstDay = DateTime.utc(2015, 01, 01);
final kLastDay = DateTime.utc(2040, 12, 31);

const listeDrawer = ["Accueil", "Mon Profil", "Planifier une session", "Déconnexion"];
var listeRedirection = [Home(), Profile(), PlanSess(), Login()];

var listeCours = ["Analyse 2", "Algèbre 2", "Mecara Q2", "Physique Q2", "Chimie Orga", "Info", "Envi", "Ecopol", "Anglais"];
var heuresCours = [28, 20, 20, 28, 21, 5, 7, 5, 5];
var repartCours = [50, 50, 30, 50, 65, 50, 67, 100, 100];


var valeursProfil = ["Agathe Moineau", "Umons", "Faculté Polytechnique de Mons", "Ingénieur civil orientation générale", "BA1" ];
var etiquettesProfil = ["Etablissement", "Faculté", "Cursus", "Année d'étude"];

