import 'package:flutter/material.dart';

class WordsPage extends StatelessWidget {
  final String selectedLanguage;

  WordsPage({required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getLocalizedText('Words')),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          _getLocalizedText('This is the Words page.'),
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  // Helper function to provide localized text
  String _getLocalizedText(String key) {
    Map<String, Map<String, String>> localizedTexts = {
      'en': {
        'Words': 'Words',
        'This is the Words page.': 'This is the Words page.',
      },
      'kn': {
        'Words': 'ಪದಗಳು',
        'This is the Words page.': 'ಇದು ಪದಗಳ ಪುಟ.',
      },
    };

    return localizedTexts[selectedLanguage]?[key] ?? key;
  }
}
