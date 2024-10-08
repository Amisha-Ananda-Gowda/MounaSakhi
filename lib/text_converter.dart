import 'package:flutter/material.dart';

class TextConverterPage extends StatelessWidget {
  final String selectedLanguage; // Add selectedLanguage variable

  // Update the constructor to accept selectedLanguage
  TextConverterPage({required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text to ISL Converter'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'Welcome to the Text to ISL Converter! Selected language: $selectedLanguage', // Display selectedLanguage
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
