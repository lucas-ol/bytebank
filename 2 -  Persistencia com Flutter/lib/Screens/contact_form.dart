import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:flutter/material.dart';
import '../Models/contact.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ContactFormState();
  }
}

class ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final ContactDao _dao = ContactDao();
  final TextEditingController _accountNumberController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: "Full Name",
            ),
            style: const TextStyle(fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _accountNumberController,
              decoration: const InputDecoration(
                labelText: "Account Number",
              ),
              style: const TextStyle(fontSize: 24),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.secondary),
                      onPressed: () {
                        final String name = _nameController.text;
                        final int? accountNumber =
                            int.tryParse(_accountNumberController.text);
                        if (name != "" && accountNumber != null) {
                          final Contact newContact =
                              Contact(0, name, accountNumber);
                          _dao
                              .save(newContact)
                              .then((value) => Navigator.pop(context));
                        }
                      },
                      child: const Text("Create"))))
        ]),
      ),
    );
  }
}
