import 'package:flutter/material.dart';
import 'dart:convert';

class Wizard3 extends StatelessWidget {
  final Function previousPage;
  final Map<String, dynamic> formData;

  Wizard3({required this.previousPage, required this.formData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Review and Submit'),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                JsonEncoder.withIndent('  ').convert(formData),
                style: TextStyle(fontFamily: 'monospace'),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  previousPage();
                },
                child: Text('Previous'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Submit data to API
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
