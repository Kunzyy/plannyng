import 'package:flutter/material.dart';
import 'package:plannyng/classes.dart';
import 'package:plannyng/database_helper.dart';

import '../Constants.dart';

import 'signIn.dart';
import 'home.dart';
import 'package:plannyng/classes.dart';
import 'package:plannyng/functionsWidgets.dart';


class Login extends StatefulWidget {

  int wantDisconnect;

  Login({ @required this.wantDisconnect, Key key}) : super(key: key);
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
    int wantDisconnect = widget.wantDisconnect;
    if(wantDisconnect == 1) {
      _logoutUser(idLoggedIn);
      idLoggedIn = null;
    }

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
              SizedBox(height: MediaQuery.of(context).size.height / 4.75),
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
                                    builder: (context) => Home(user:User("", "", [])));
                                Navigator.pushReplacement(context, newRoute);
                              }
                              else{
                                print("Access denied");
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                        Text("Accès refusé")));
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
              SizedBox(height: MediaQuery.of(context).size.height / 16),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Vous n'avez pas encore de compte ?"),
                    ),
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

  Future<void> _logoutUser(int id) async {
    await dbHelper.logout(id);
  }
}
