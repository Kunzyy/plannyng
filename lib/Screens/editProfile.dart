import 'package:flutter/material.dart';

import 'package:plannyng/Constants.dart';
import 'package:plannyng/main.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "Modifier mon profil"
          ),
          backgroundColor: primaryColor,
          elevation: 0.0
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: backgroundDeco,
      ),
    );
  }
}
