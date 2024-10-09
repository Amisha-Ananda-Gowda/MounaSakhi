import 'package:flutter/material.dart';

class NumbersPage extends StatelessWidget {
  final String selectedLanguage;

  NumbersPage({required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getLocalizedText('Numbers')),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          _getLocalizedText('This is the Numbers page.'),
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  // Helper function to provide localized text
  String _getLocalizedText(String key) {
    Map<String, Map<String, String>> localizedTexts = {
      'en': {
        'Numbers': 'Numbers',
        'This is the Numbers page.': 'This is the Numbers page.',
      },
      'kn': {
        'Numbers': 'ಸಂಖ್ಯೆಗಳು',
        'This is the Numbers page.': 'ಇದು ಸಂಖ್ಯೆಗಳ ಪುಟ.',
      },
    };

    return localizedTexts[selectedLanguage]?[key] ?? key;
  }
}
