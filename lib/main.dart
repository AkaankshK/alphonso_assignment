import 'package:alphonso_assignment/modules/home/view/home.dart';
import 'package:alphonso_assignment/shared/globals.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: snackbarKey,
      home: const Home(),
    );
  }
}
