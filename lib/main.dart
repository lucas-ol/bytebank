import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        body: const ListaTransferencias(),
        appBar: AppBar(
          title: const Text("Transferencias"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            log("Teste");
          },
          child: const Icon(Icons.add),
        )),
  ));
}

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ItemTransferencia(Tranferencia(100.00, 100)),
      ItemTransferencia(Tranferencia(200.00, 200)),
      ItemTransferencia(Tranferencia(300.02, 300)),
    ]);
  }
}

class ItemTransferencia extends StatelessWidget {
  const ItemTransferencia(this.tranferencia);

  final Tranferencia tranferencia;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: const Icon(Icons.monetization_on),
      title: Text(tranferencia.valor.toString()),
      subtitle: Text(tranferencia.numeroConta.toString()),
    ));
  }
}

class Tranferencia {
  final double valor;
  final double numeroConta;
  Tranferencia(this.valor, this.numeroConta);
}
