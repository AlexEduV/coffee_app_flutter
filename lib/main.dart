 import 'package:coffee_app_flutter/pages/home_page.dart';
import 'package:coffee_app_flutter/style/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Coffee App',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'SF Pro',
        brightness: Brightness.dark,
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[700],
          ),
        ),
        searchBarTheme: SearchBarThemeData(
          hintStyle: WidgetStateProperty.all(
            TextStyle(
              color: Colors.grey[700],
            )
          ),
          backgroundColor: WidgetStateProperty.all(ProjectColors.textInputBackground),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          shadowColor: WidgetStateProperty.all(Colors.transparent),

        )
      ),
      home: const MyHomePage(),
    );
  }
}
