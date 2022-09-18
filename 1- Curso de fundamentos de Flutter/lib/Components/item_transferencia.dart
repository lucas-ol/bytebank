import 'package:flutter/material.dart';

import '../Models/Transferencia.dart';

class ItemTransferencia extends StatelessWidget {
  const ItemTransferencia(this.tranferencia, {Key? key}) : super(key: key);

  final Transferencia tranferencia;

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
