import 'package:flutter/material.dart';

import 'package:plannyng/Screens/home.dart';
import 'package:plannyng/Screens/login.dart';
import 'package:plannyng/Screens/plannSess.dart';
import 'package:plannyng/Screens/profile.dart';

// Toutes les couleurs utilisées

const primaryColor = Color(0xff6DD7C8);
const secondaryColor = Color(0xffD76D7C);
const accentColor = Color(0xffB1D76D);
const otherColor = Color(0xff936DD7);

// Tous les textes utilisés

const nomApp = "Plannyng";

const formMail = "Entrez votre email";
const formErrorMail = "Vous n'avez pas inséré votre email !";
const formMDP = "Entrez votre mot de passe";
const formErrorMDP = "Vous n'avez pas inséré votre mot de passe !";
const formValMDP = "Vérification de votre mot de passe";
const formErrorValMDP = "Vous n'avez pas inséré votre mot de passe !";
const formNom = "Entrez votre nom";
const formErrorNom = "Vous n'avez pas inséré votre nom !";

// Tous les styles de texte utilisés

const titreStyle = TextStyle();

const titreEvent = TextStyle();

const titreDrawer = TextStyle(
    fontSize: 35.0
);

// Decorated Box with background

const backgroundDeco = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/background/test.jpg'),
    fit: BoxFit.cover,
  ),
);

// Autres

final kFirstDay = DateTime.utc(2015, 01, 01);
final kLastDay = DateTime.utc(2040, 12, 31);

const listeDrawer = ["Accueil", "Mon Profil", "Planifier une session", "Déconnexion"];
var listeRedirection = [Home(), Profile(), PlanSess(), Login()];

var listeCours = ["Analyse 2", "Algèbre 2", "Mecara Q2", "Physique Q2", "Chimie Orga", "Info", "Envi", "Ecopol", "Anglais"];
var heuresCours = [28, 20, 20, 28, 21, 5, 7, 5, 5];
var repartCours = [50, 50, 30, 50, 65, 50, 67, 100, 100];