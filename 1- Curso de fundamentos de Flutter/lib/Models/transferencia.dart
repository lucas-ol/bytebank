// ignore: file_names
class Transferencia {
  final double valor;
  final int numeroConta;
  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Numero da conta $numeroConta,Valor: $valor';
  }
}
