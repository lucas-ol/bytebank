import 'package:flutter/material.dart';
import 'Screens/Transferencias/lista.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Colors.blue[700], primary: Colors.green[900]),
        ),
        home: ListaTransferencias());
  }
}
