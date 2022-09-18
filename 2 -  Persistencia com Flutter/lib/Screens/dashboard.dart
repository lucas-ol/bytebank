import 'package:bytebank/Screens/contact_list.dart';
import 'package:bytebank/Screens/transactions_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/bytebank_logo.png')),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _FeatureItem('Transfer', Icons.monetization_on,
                    onTap: () => _showContactsList(context)),
                _FeatureItem('Transaction Feed', Icons.description,
                    onTap: () => _showTransactionList(context)),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showContactsList(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (builder) {
      return const ContactList();
    }));
  }

  void _showTransactionList(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (builder) => const TransactionsList()));
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem(this._name, this._icon, {required this.onTap});
  final Function onTap;
  final String _name;
  final IconData _icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
          color: Theme.of(context).colorScheme.primary,
          child: InkWell(
            onTap: () {
              onTap();
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 100,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    _icon,
                    color: Colors.white,
                    size: 24,
                  ),
                  Text(
                    _name,
                    style: const TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
