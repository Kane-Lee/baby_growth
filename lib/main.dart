import 'package:flutter/material.dart';
import 'pages/input_page.dart';

void main() => runApp(BabyCalculator());

class BabyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFF5C3C2),
        scaffoldBackgroundColor: Color(0xFFFFFEFA),
      ),
      home: InputPage(),
    );
  }
}



