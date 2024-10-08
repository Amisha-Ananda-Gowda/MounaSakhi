import 'package:flutter/material.dart';

class LearnPage extends StatelessWidget {
  final String selectedLanguage; // Add selectedLanguage variable

  // Update the constructor to accept selectedLanguage
  LearnPage({required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Page'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'Welcome to the Learn Page! Selected language: $selectedLanguage', // Display selectedLanguage
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
