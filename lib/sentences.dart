import 'package:flutter/material.dart';

class SentencesPage extends StatelessWidget {
  final String selectedLanguage;

  SentencesPage({required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getLocalizedText('Sentences')),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          _getLocalizedText('This is the Sentences page.'),
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  // Helper function to provide localized text
  String _getLocalizedText(String key) {
    Map<String, Map<String, String>> localizedTexts = {
      'en': {
        'Sentences': 'Sentences',
        'This is the Sentences page.': 'This is the Sentences page.',
      },
      'kn': {
        'Sentences': 'ವಾಕ್ಯಗಳು',
        'This is the Sentences page.': 'ಇದು ವಾಕ್ಯಗಳ ಪುಟ.',
      },
    };

    return localizedTexts[selectedLanguage]?[key] ?? key;
  }
}
