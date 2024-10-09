import 'package:flutter/material.dart';

class AlphabetsPage extends StatelessWidget {
  final String selectedLanguage;

  AlphabetsPage({required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getLocalizedText('Alphabets')),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          _getLocalizedText('This is the Alphabets page.'),
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  // Helper function to provide localized text
  String _getLocalizedText(String key) {
    Map<String, Map<String, String>> localizedTexts = {
      'en': {
        'Alphabets': 'Alphabets',
        'This is the Alphabets page.': 'This is the Alphabets page.',
      },
      'kn': {
        'Alphabets': 'ಅಕ್ಷರಗಳು',
        'This is the Alphabets page.': 'ಇದು ಅಕ್ಷರಗಳ ಪುಟ.',
      },
    };

    return localizedTexts[selectedLanguage]?[key] ?? key;
  }
}
