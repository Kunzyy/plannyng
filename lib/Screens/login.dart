import 'package:flutter/material.dart';

import '../Constants.dart';

import 'signIn.dart';
import 'home.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: formMail,
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: primaryColor),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return formErrorMail;
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: formMDP,
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: primaryColor),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return formErrorMDP;
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                      ),
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState.validate()) {
                          // Process data.
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Vérification en cours")));
                          dynamic newRoute = MaterialPageRoute(builder: (context) => Home());
                          Navigator.pushReplacement(context, newRoute);
                        }
                      },
                      child: Text("Me connecter"),
                    ),
                  ),
                ],
              ),
            ),
            Container(

              child: Column(
                children: <Widget>[
                  Text("Vous n'avez pas encore de compte ?"),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                    ),
                    onPressed: () {
                      dynamic newRoute = MaterialPageRoute(builder: (context) => SignIn());
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
    );
  }
}
