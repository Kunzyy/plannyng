import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mon plannyng"
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/test.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
