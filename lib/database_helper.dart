import 'dart:io';

import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:plannyng/Constants.dart';
import 'package:plannyng/classes.dart';

class DatabaseHelper {

  static final _databaseName = "Plannyng.db";
  static final _databaseVersion = 1;

  // Nom des tables et des colonnes de la base de données - Plus facile et plus pratique à utiliser

  // Nom de colonne commune à plusieurs tables
  static final columnId = '_id';
  static final columnName = 'name';
  static final start = 'start';
  static final finish = 'finish';

  //Users table
  static final usersTable = 'users';

  static final columnOption = 'option';
  static final columnAnnee = 'annee_etude';
  static final columnMail = 'mail';
  static final columnPassword = 'password';
  static final isConnected = 'isConnected';
  static final hourPerDay = 'hourPerDay';
  static final nbrePause = 'nbrePause';
  static final durPause = 'durPause';
  static final midiPause = 'midiPause';
  static final lunchBegin = 'lunchBegin';
  static final lunchFinish = 'lunchFinish';


  //Cours table
  static final coursTable = 'cours';

  static final repartition = 'repartition';
  static final hoursTheory = 'hours_theory';
  static final hoursExo = 'hours_exo';

  // Progression table
  static final progressionTable = 'progression';

  static final columnIdUsers = 'id_users';
  static final columnIdCours = 'id_cours';
  static final timeLeft = 'time_left';
  static final progTheorie = 'prog_theorie';
  static final progExo = 'prog_exo';
  static final interest = 'interest';


  // PlannyngBlock table
  static final plannyngTable = 'plannyngBlock';

  static final columnIdProg = 'id_prog';
  static final color = 'color';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    print(path);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {

    await db.execute('''
          CREATE TABLE $usersTable (
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
          $columnName STRING,
          $columnOption STRING,
          $columnAnnee STRING,
          $columnMail STRING,
          $columnPassword STRING,
          $isConnected INTEGER DEFAULT (0),
          $hourPerDay INTEGER,
          $nbrePause INTEGER,
          $durPause INTEGER,
          $start TIME,
          $finish TIME,
          $midiPause TIME,
          $lunchBegin TIME,
          $lunchFinish TIME);
          ''');

    await db.execute('''
          CREATE TABLE $coursTable (
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
          $columnName STRING,
          $repartition INTEGER,
          $hoursTheory INTEGER,
          $hoursExo INTEGER,
          $color INTEGER);
          ''');

    await db.execute('''
          CREATE TABLE $progressionTable (
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
          $columnIdUsers INTEGER REFERENCES users ($columnId) ON DELETE CASCADE NOT NULL,
          $columnIdCours INTEGER REFERENCES cours ($columnId) ON DELETE CASCADE NOT NULL,
          $timeLeft INTEGER,
          $progTheorie INTEGER,
          $progExo INTEGER,
          $interest INTEGER);
          ''');

    await db.execute('''
          CREATE TABLE plannyngBlock (
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
          $columnIdProg INTEGER REFERENCES progression ($columnId) ON DELETE CASCADE NOT NULL,
          $columnName STRING,
          $start TIME,
          $finish TIME,
          $color STRING);
          ''');

    //Insert one user
    Map<String, dynamic> tmpUserRow = {
      columnName: "Agathe Moineau",
      columnMail: "agathe@moineau.be",
      columnPassword : "Password",
      isConnected: 1
    };

    final id = await db.insert(usersTable, tmpUserRow);
    print('Remplissage préalable de la db ; inserted first id: $id and insert courses');

    //Insert des cours
    int n = listeCours.length;
    for(int i = 0;i<n;i++){
      Map<String, dynamic> tmpCourseRow = {
        columnName : listeCours[i],
        repartition : repartCours[i],
        hoursTheory: heuresCoursTheory[i],
        hoursExo: heuresCoursExo[i],
        color: couleurCours[i]
      };
      await db.insert(coursTable, tmpCourseRow);
    }
    /*
    print("Voici les cours");
    print(await db.query(coursTable));*/
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insertUser(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(usersTable, row);
  }

  Future<int> login(Map<String, dynamic> row) async {
    Database db = await instance.database;
    String mail = row[columnMail];
    String password = row[columnPassword];

    final id = Sqflite.firstIntValue(await db.rawQuery(
        'SELECT $columnId FROM $usersTable WHERE $columnMail = "$mail" AND $columnPassword = "$password"'));

    await db.rawQuery(
        'UPDATE $usersTable SET $isConnected = 1 WHERE $columnId = "$id"');

    return id;
  }

  Future<void> logout(int id) async {
    Database db = await instance.database;
    db.rawQuery(
        'UPDATE $usersTable SET $isConnected = 0 WHERE $columnId = "$id"');
  }

  Future<int> checkSomeoneIsConnected() async{
    Database db = await instance.database;

    final listUsersConnected = await db.query(usersTable, where: '$isConnected IN (?)', whereArgs: [1]);

    if(listUsersConnected.length == 1)
      return listUsersConnected[0][columnId];
    else
      return null;
  }

  Future<User> getUser(int id) async {
    Database db = await instance.database;
    final tmpUserInfos = await db.query(usersTable, where: '$columnId IN (?)', whereArgs: [id]);
    final userInfos = tmpUserInfos[0];

    final courses = await db.query(coursTable);
    List<Progression> coursList = [];
    for (final course in courses) {
      Color tmpColor = Color(course[color]);
      Course tmp = Course(course[columnName], course[repartition], course[hoursTheory], course[hoursExo], tmpColor);
      Progression progtmp = Progression(tmp);
      coursList.add(progtmp);
    }

    User user = User(userInfos[columnName], userInfos[columnPassword], coursList);
    return user;
  }
}