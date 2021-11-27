import 'package:flutter/material.dart';
import 'package:mx_markdown/home_screen.dart';
import 'package:mx_markdown/main_page_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'markdown',
      initialRoute: '/',
      home: HomeScreen(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(builder: (_) =>
            MainPageScreen(
            ),
        );
      },
    ),
  );
}

