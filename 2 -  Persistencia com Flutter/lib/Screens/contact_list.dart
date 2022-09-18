import 'package:bytebank/components/progress.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:flutter/material.dart';
import '../Models/contact.dart';
import 'contact_form.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);
  final String test = "";
  @override
  State<StatefulWidget> createState() {
    return _ContactListState();
  }
}

class _ContactListState extends State<ContactList> {
  final ContactDao _dao = ContactDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(
                  MaterialPageRoute(builder: (builder) => const ContactForm()))
              .then(
                (value) => setState(() {}),
              );
        },
      ),
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: FutureBuilder<List<Contact>>(
          future: _dao.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return const Progress();
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Contact> contacts = snapshot.data ?? [];
                return ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      final Contact contact = contacts[index];
                      return _ContactItem(contact);
                    });
            }
            return const Text('Unknown error');
          }),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact _contact;
  const _ContactItem(this._contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(
        _contact.name,
        style: const TextStyle(fontSize: 24),
      ),
      subtitle: Text(_contact.accountNumber.toString(),
          style: const TextStyle(fontSize: 16)),
    ));
  }
}
