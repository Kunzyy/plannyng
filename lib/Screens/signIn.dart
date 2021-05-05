import 'package:flutter/material.dart';
import 'package:plannyng/database_helper.dart';

import '../Constants.dart';

import 'login.dart';
import 'home.dart';
import 'package:plannyng/functionsWidgets.dart';
import 'package:plannyng/classes.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final dbHelper = DatabaseHelper.instance;

  String nom = '';
  String mail = '';
  String password = '';
  String valPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Inscription"),
          backgroundColor: primaryColor,
          elevation: 0.0),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: backgroundDeco,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 4.75,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: formNom,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: primaryColor),
                          ),
                        ),
                        onSaved: (value) => setState(() => nom = value),
                        validator: (value) {
                          if (value.isEmpty) {
                            return formErrorNom;
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: formMail,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: primaryColor),
                          ),
                        ),
                        onSaved: (value) => setState(() => mail = value),
                        validator: (value) {
                          if (value.isEmpty) {
                            return formErrorMail;
                          }
                          if(isEmail(value) == false){
                            return "Cette adresse n'est pas valide";
                          }

                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: formMDP,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: primaryColor),
                          ),
                        ),
                        onChanged: (value) =>
                            setState(() => password = value),
                        onSaved: (value) => setState(() => password = value),
                        validator: (value) {
                          if (value.isEmpty) {
                            return formErrorMDP;
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: formValMDP,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: primaryColor),
                          ),
                        ),
                        onChanged: (value) =>
                            setState(() => valPassword = value),
                        validator: (value) {
                          if (value.isEmpty) {
                            return formErrorValMDP;
                          }
                          else {
                            if (password != valPassword) {
                              return formDiffMDP;
                            }
                            else
                              return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              primaryColor),
                        ),
                        onPressed: () async {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (_formKey.currentState.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  // Process data.
                                    content:
                                    Text("Traitement des données")));
                            _formKey.currentState.save(); // Sauvegarde de l'état des champs
                            final id = await _insertUser();
                            if (id != null){
                              idLoggedIn = id;
                              dynamic newRoute = MaterialPageRoute(
                                  builder: (context) => Home(user:User("", "", [])));
                              Navigator.pushReplacement(context, newRoute);
                            }
                            else{
                              print("Error insert database");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                      Text("Erreur dans l'insertion d'une nouvel utilisateur")));
                            }
                          }
                        },
                        child: Text("M'inscrire !"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Vous avez déjà un compte ?"),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryColor),
                      ),
                      onPressed: () {
                        dynamic newRoute =
                            MaterialPageRoute(builder: (context) => Login(wantDisconnect: 1));
                        Navigator.pushReplacement(context, newRoute);
                      },
                      child: Text("Je me connecte !"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<int> _insertUser() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : nom,
      DatabaseHelper.columnMail : mail,
      DatabaseHelper.columnPassword: password
    };
    final id = await dbHelper.insertUser(row);
    print('inserted row id: $id');
    return id;
  }
}
