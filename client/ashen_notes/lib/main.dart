import 'package:ashen_notes/pages/home.dart';
import 'package:ashen_notes/utils/utils.dart';
import 'package:flutter/material.dart';


void main() 
{
  runApp(const App());
}

class App extends StatelessWidget 
{
  const App({Key? key}) : super(key: key);
  // This widget is the root of application.
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      title: 'Ashen Notes',
      theme: ThemeData(
        primarySwatch: Utils.createMaterialColor(const Color(0xFF781818)),
      ),
      home: const HomePage(title: 'Ashen Notes'),
    );
  }
}
