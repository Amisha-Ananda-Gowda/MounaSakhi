import 'package:flutter/material.dart';

class SpeechConverterPage extends StatelessWidget {
  final String selectedLanguage; // Add selectedLanguage variable

  // Update the constructor to accept selectedLanguage
  SpeechConverterPage({required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech to ISL Converter'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'Welcome to the Speech to ISL Converter! Selected language: $selectedLanguage', // Display selectedLanguage
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
