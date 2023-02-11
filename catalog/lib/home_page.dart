import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Center,
        Container,
        //Key,
        Scaffold,
        StatelessWidget,
        Text,
        Widget;

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Codepur";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MOHAN MEDICAL")),
      body: Center(
        child: Container(
          child: Text("Welcome to $days of flutter by $name"),
        ),
      ),
    );
  }
}
