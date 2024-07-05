import 'package:flutter/material.dart';
import 'wizard1.dart';
import 'wizard2.dart';
import 'wizard3.dart';

class WizardScreen extends StatefulWidget {
  @override
  _WizardScreenState createState() => _WizardScreenState();
}

class _WizardScreenState extends State<WizardScreen> {
  PageController _pageController = PageController();
  Map<String, dynamic> formData = {};

  void nextPage() {
    _pageController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void previousPage() {
    _pageController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Claim Wizard'),
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Wizard1(nextPage: nextPage, formData: formData),
          Wizard2(
              nextPage: nextPage,
              previousPage: previousPage,
              formData: formData),
          Wizard3(previousPage: previousPage, formData: formData),
        ],
      ),
    );
  }
}
