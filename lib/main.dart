import 'package:flutter/material.dart';
import 'selection_page.dart'; // Import your updated SelectionPage
import 'localization.dart'; // Import your localization file

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _selectedLanguage = 'en'; // Default language
  bool _isDarkTheme = false; // Default theme is light

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: HomePage(
        selectedLanguage: _selectedLanguage,
        onLanguageChanged: (String newLanguage) {
          setState(() {
            _selectedLanguage = newLanguage;
          });
        },
        isDarkTheme: _isDarkTheme,
        onThemeChanged: (bool isDark) {
          setState(() {
            _isDarkTheme = isDark;
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String selectedLanguage;
  final Function(String) onLanguageChanged;
  final bool isDarkTheme;
  final Function(bool) onThemeChanged;

  HomePage({
    required this.selectedLanguage,
    required this.onLanguageChanged,
    required this.isDarkTheme,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: isDarkTheme ? Colors.grey[850] : Colors.grey[300],
       // Grey for dark theme, light grey for light theme
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green.shade700,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Languages'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _showLanguageOptions(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // Profile page logic
                Navigator.pop(context); // Close the drawer
              },
            ),
            // Toggle for Dark/Light Theme
            ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text('Switch to ${isDarkTheme ? 'Light' : 'Dark'} Theme'),
              trailing: Switch(
                value: isDarkTheme,
                onChanged: (value) {
                  onThemeChanged(value); // Update theme
                },
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: isDarkTheme ? Colors.grey: Colors.white, // Set body background color based on theme
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'), // Replace with your image
                    fit: BoxFit.cover, // Cover the entire area
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Welcome Image
                      Container(
                        width: 250,
                        height: 250,
                        child: Image.asset(
                          'assets/images/welcome.png', // Replace with your image path
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Welcome Text
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        decoration: BoxDecoration(
                          color: Colors.green.shade700,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'WELCOME',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              AppLocalizations.getTranslation('welcome', selectedLanguage) ?? 'ನಮಸ್ಕಾರ',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      // Get Started Button
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to SelectionPage with the selected language
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectionPage(
                                selectedLanguage: selectedLanguage,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade600, // Button background color
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show language options
  void _showLanguageOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          //backgroundColor: Color(0xFF424242), // Dark background for the dialog
          title: Text(
            AppLocalizations.getTranslation('select_language_title', selectedLanguage) ?? '',
            style: TextStyle(color: Colors.white),
          ),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: ['English', 'Kannada'].map((language) {
                return ListTile(
                  title: Text(
                    language,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    String newLanguage = language == 'Kannada' ? 'kn' : 'en';
                    onLanguageChanged(newLanguage); // Update selected language
                    Navigator.pop(context); // Close the dialog
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
