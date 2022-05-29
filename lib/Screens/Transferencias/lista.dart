import 'package:flutter/material.dart';

import '../../Components/item_transferencia.dart';
import '../../Models/Transferencia.dart';
import 'formulario.dart';

const _tituloAppBar = "Transferencias";

class ListaTransferencias extends StatefulWidget {
  ListaTransferencias({Key? key}) : super(key: key);

  final List<Transferencia> _listaDeTransferencias = <Transferencia>[];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(_tituloAppBar),
        ),
        body: ListView.builder(
          itemCount: widget._listaDeTransferencias.length,
          itemBuilder: (ctx, index) {
            final transferencia = widget._listaDeTransferencias[index];
            debugPrint("Tansferencia recebida no listvie  $transferencia");

            return ItemTransferencia(transferencia);
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return const FormularioTransferencia();
              })).then((tranferenciaRecebida) {
                if (tranferenciaRecebida != null) {
                  setState(() {
                    widget._listaDeTransferencias.add(tranferenciaRecebida);
                  });
                  debugPrint("Tansferencia recebida $tranferenciaRecebida");
                }
              });
            },
            child: const Icon(Icons.add)));
  }
}
