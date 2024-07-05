import 'package:flutter/material.dart';
import 'wizard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Claim Wizard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WizardScreen(),
    );
  }
}
