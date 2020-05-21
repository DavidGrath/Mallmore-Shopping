import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() => runApp(MallmoreApp());

class MallmoreApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "VarelaRound"
      ),
      home: HomeScreen(),
    );
  }

}