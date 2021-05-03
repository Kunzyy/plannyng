import 'package:flutter/material.dart';
import 'package:plannyng/database_helper.dart';

import '../Constants.dart';

import 'login.dart';
import 'home.dart';

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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
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
                          decoration: const InputDecoration(
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
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
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
                          decoration: const InputDecoration(
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
                            ),
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      // Process data.
                                        content:
                                        Text("Traitement des données")));
                                _formKey.currentState.save(); // Sauvegarde de l'état des champs
                                _insertUser();
                                dynamic newRoute = MaterialPageRoute(
                                    builder: (context) => Home());
                                Navigator.pushReplacement(context, newRoute);
                              }
                            },
                            child: Text("M'inscrire !"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text("Vous avez déjà un compte ?"),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primaryColor),
                        ),
                        onPressed: () {
                          dynamic newRoute =
                              MaterialPageRoute(builder: (context) => Login());
                          Navigator.pushReplacement(context, newRoute);
                        },
                        child: Text("Je me connecte !"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _insertUser() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : nom,
      DatabaseHelper.columnMail : mail,
      DatabaseHelper.columnPassword: password
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }
}
