import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:plannyng/Components/Calendar_Component.dart';
import 'package:plannyng/Components/Drawer_Component.dart';

import '../Constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
      appBar: AppBar(
        title: Text(
          "Mon plannyng"
        ),
        backgroundColor: primaryColor,
        elevation: 0.0
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: backgroundDeco,
        child: CalendarComponent(),
      ),
    );
  }
}
