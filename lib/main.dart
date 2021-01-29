import 'package:flutter/material.dart';
import 'package:wayha_covid_dash/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19 in Laos Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: "NotoSansLao",
        cardTheme: CardTheme(elevation: 1),
      ),
      home: HomePage(),
    );
  }
}
