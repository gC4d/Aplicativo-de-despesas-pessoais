import 'package:flutter/material.dart';
import 'mainScreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ThemeData tema = ThemeData();

    return MaterialApp(
      title: 'Despesas Pessoais',
        theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.deepPurple,
          onPrimary: Colors.white,
          secondary: Colors.deepPurple,
          onSecondary: Colors.white
        ),
        textTheme: tema.textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: MainScreen(),
    );
  }
}
