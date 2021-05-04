import 'package:flutter/material.dart';
import 'package:plannyng/database_helper.dart';

import '../Constants.dart';

import 'signIn.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final dbHelper = DatabaseHelper.instance;
  final _formKey = GlobalKey<FormState>();

  String mail = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Connexion"),
          backgroundColor: primaryColor,
          elevation: 0.0),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: backgroundDeco,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100.0),
                child: Form(
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
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: formMDP,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: primaryColor),
                            ),
                          ),
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
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
                            ),
                            onPressed: () async { //Le async est là parce qu'on attend une réponse de la fonction _loginUser()
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                        Text("Vérification en cours")));
                                // Process data.
                                _formKey.currentState.save(); //Sauvegarde de l'état des champs
                                final id = await _loginUser();
                                print(id);
                                if(id != null){
                                  idLoggedIn = id;
                                  dynamic newRoute = MaterialPageRoute(
                                      builder: (context) => Home());
                                  Navigator.pushReplacement(context, newRoute);
                                }
                                else{
                                  print("Access denied");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                          Text("Accès réfusé")));
                                }
                              }
                            },
                            child: Text("Me connecter"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text("Vous n'avez pas encore de compte ?"),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor),
                        ),
                        onPressed: () {
                          dynamic newRoute =
                          MaterialPageRoute(builder: (context) => SignIn());
                          Navigator.pushReplacement(context, newRoute);
                        },
                        child: Text("Je m'inscris !"),
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

  //On peut se login et on récupère notre id qui nous sert durant toute la session connectée

  Future<int> _loginUser() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnMail : mail,
      DatabaseHelper.columnPassword: password
    };
    final id = await dbHelper.login(row);
    print('inserted row id: $id');
    return id;
  }
}
