import 'package:bytebank2/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}
class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        accentColor: Colors.deepPurple[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurple[700],
          textTheme: ButtonTextTheme.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 12,
          ),
          labelStyle: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      home: Dashboard(),
    );
  }
}
