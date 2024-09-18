import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfawry/screen/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        textTheme: GoogleFonts.cairoTextTheme(), // Applying Google Fonts Cairo globally
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow.shade700,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
           foregroundColor: Colors.white, backgroundColor: Colors.yellow.shade700,
            textStyle: GoogleFonts.cairo(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
