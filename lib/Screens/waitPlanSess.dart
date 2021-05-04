import 'package:flutter/material.dart';

class WaitPlanSess extends StatefulWidget {
  @override
  _WaitPlanSessState createState() => _WaitPlanSessState();
}

class _WaitPlanSessState extends State<WaitPlanSess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
            "Planifier une session"
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Text("test"),
          ],
        ),
      ),
    );
  }
}
