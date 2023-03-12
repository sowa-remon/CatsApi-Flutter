import 'package:flutter/material.dart';
import 'package:Gatitos/pages/home_page.dart';
import 'package:Gatitos/pages/cat_detail_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gatos',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'detail': (context) => const CatDetail(),
      },
    );
  }
}
