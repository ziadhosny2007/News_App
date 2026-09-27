import 'package:flutter/material.dart';
import 'package:news_app/data/api.dart';
import 'package:news_app/view/home.dart';
import 'package:news_app/view/theme.dart';

Future<void> main() async {
  Api.getNews();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.dark, home: Home());
  }
}
