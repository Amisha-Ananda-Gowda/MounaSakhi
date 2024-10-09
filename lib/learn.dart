import 'package:flutter/material.dart';
import 'alphabets.dart'; // Import the alphabets page
import 'numbers.dart'; // Import the numbers page
import 'words.dart'; // Import the words page
import 'sentences.dart'; // Import the sentences page

class LearnPage extends StatelessWidget {
  final String selectedLanguage;

  LearnPage({required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getLocalizedText('Learn'),
          style: TextStyle(fontSize: 22),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous screen
          },
        ),
        backgroundColor: Colors.black, // Matches the dark style in the UI
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade800, Colors.black], // Gradient background
          ),
        ),
        child: Column(
          children: [
            // Image container (The large top image with text)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/welcome.png'),
                    fit: BoxFit.cover, // Fit the image to cover the entire space
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Button List (Words, Numbers, Stories, Mistakes)
            _buildOptionButton(
              context,
              title: _getLocalizedText('Alphabets'),
              icon: Icons.menu_book,
              color: Colors.blueAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlphabetsPage(selectedLanguage: selectedLanguage), // Pass selectedLanguage
                  ),
                );
              },
            ),
            _buildOptionButton(
              context,
              title: _getLocalizedText('Numbers'),
              icon: Icons.calculate,
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NumbersPage(selectedLanguage: selectedLanguage), // Pass selectedLanguage
                  ),
                );
              },
            ),
            _buildOptionButton(
              context,
              title: _getLocalizedText('Words'),
              icon: Icons.book,
              color: Colors.redAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WordsPage(selectedLanguage: selectedLanguage), // Pass selectedLanguage
                  ),
                );
              },
            ),
            _buildOptionButton(
              context,
              title: _getLocalizedText('Sentences'),
              icon: Icons.auto_fix_high,
              color: Colors.lightBlue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SentencesPage(selectedLanguage: selectedLanguage), // Pass selectedLanguage
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Method to create each option button
  Widget _buildOptionButton(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Color color,
        required VoidCallback onTap, // Added onTap callback
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: ElevatedButton(
        onPressed: onTap, // Set the onTap callback here
        style: ElevatedButton.styleFrom(
          primary: Colors.grey.shade700, // Grey background for the button
          padding: EdgeInsets.symmetric(vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded edges
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Icon(icon, color: color, size: 28), // Icon color and size
          ],
        ),
      ),
    );
  }

  // Helper function to provide localized text based on the selected language
  String _getLocalizedText(String key) {
    Map<String, Map<String, String>> localizedTexts = {
      'en': {
        'Learn': 'Learn',
        'Alphabets': 'Alphabets',
        'Numbers': 'Numbers',
        'Words': 'Words',
        'Sentences': 'Sentences',
      },
      'kn': {
        'Learn': 'ಕಲಿ',
        'Alphabets': 'ಅಕ್ಷರಗಳು',
        'Numbers': 'ಸಂಖ್ಯೆಗಳು',
        'Words': 'ಪದಗಳು',
        'Sentences': 'ವಾಕ್ಯಗಳು',
      },
    };

    return localizedTexts[selectedLanguage]?[key] ?? key; // Fallback to key if no translation found
  }
}

// Example of AlphabetsPage
class AlphabetsPage extends StatelessWidget {
  final String selectedLanguage; // Accept the selectedLanguage

  AlphabetsPage({required this.selectedLanguage}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedLanguage == 'en' ? 'Alphabets' : 'ಅಕ್ಷರಗಳು'), // Localized title
      ),
      body: Center(
        child: Text(
          selectedLanguage == 'en' ? 'This is the Alphabets page.' : 'ಇದು ಅಕ್ಷರಗಳ ಪುಟ.',
        ), // Localized content
      ),
    );
  }
}

// Example of NumbersPage
class NumbersPage extends StatelessWidget {
  final String selectedLanguage; // Accept the selectedLanguage

  NumbersPage({required this.selectedLanguage}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedLanguage == 'en' ? 'Numbers' : 'ಸಂಖ್ಯೆಗಳು'), // Localized title
      ),
      body: Center(
        child: Text(
          selectedLanguage == 'en' ? 'This is the Numbers page.' : 'ಇದು ಸಂಖ್ಯೆಗಳ ಪುಟ.',
        ), // Localized content
      ),
    );
  }
}

// Example of WordsPage
class WordsPage extends StatelessWidget {
  final String selectedLanguage; // Accept the selectedLanguage

  WordsPage({required this.selectedLanguage}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedLanguage == 'en' ? 'Words' : 'ಪದಗಳು'), // Localized title
      ),
      body: Center(
        child: Text(
          selectedLanguage == 'en' ? 'This is the Words page.' : 'ಇದು ಪದಗಳ ಪುಟ.',
        ), // Localized content
      ),
    );
  }
}

// Example of SentencesPage
class SentencesPage extends StatelessWidget {
  final String selectedLanguage; // Accept the selectedLanguage

  SentencesPage({required this.selectedLanguage}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedLanguage == 'en' ? 'Sentences' : 'ವಾಕ್ಯಗಳು'), // Localized title
      ),
      body: Center(
        child: Text(
          selectedLanguage == 'en' ? 'This is the Sentences page.' : 'ಇದು ವಾಕ್ಯಗಳ ಪುಟ.',
        ), // Localized content
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LearnPage(selectedLanguage: 'en'), // Change 'en' to 'kn' for Kannada
  ));
}
