import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icon;
  const Editor(
      {Key? key,
      required this.controlador,
      required this.rotulo,
      required this.dica,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
            controller: controlador,
            style: const TextStyle(fontSize: 24),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: rotulo,
                hintText: dica,
                icon: icon != null ? Icon(icon) : null)));
  }
}
