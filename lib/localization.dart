import 'package:flutter/material.dart';

class AppLocalizations {
  static const List<String> _supportedLanguages = ['en', 'kn'];

  static const Map<String, Map<String, String>> _localizedStrings = {
    'en': {
      'select_language': 'Change the language',
      'learn': 'Learn',
      'speech_converter': 'Speech to ISL Converter',
      'text_converter': 'Text to ISL Converter',
      'select_language_title': 'Select Language',
      'language_english': 'English',
      'language_kannada': 'Kannada',
    },
    'kn': {
      'select_language': 'ಭಾಷೆಯನ್ನು ಬದಲಿಸಿ',
      'learn': 'ಕಲಿಯಿರಿ',
      'speech_converter': 'ಉಚ್ಛರಿಸು ISL ಪರಿವರ್ತಕ',
      'text_converter': 'ಪಠ್ಯ ISL ಪರಿವರ್ತಕ',
      'select_language_title': 'ಭಾಷೆ ಆಯ್ಕೆ ಮಾಡಿ',
      'language_english': 'ಆಂಗ್ಲ',
      'language_kannada': 'ಕನ್ನಡ',
    },
  };

  static String? getTranslation(String key, String lang) {
    return _localizedStrings[lang]?[key];
  }

  static List<String> get supportedLanguages => _supportedLanguages;
}
