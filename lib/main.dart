
import 'package:tictactoy/body.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int i = 1;
  int x = 1;
  int d = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic-Tac-Toy",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(), // standard dark theme
      themeMode: ThemeMode.system,
      // device controls theme
      home: const Scaffold(
          appBar: null,
          body: SafeArea(child: Body()),
          backgroundColor: Colors.white),
    );
  }
}
