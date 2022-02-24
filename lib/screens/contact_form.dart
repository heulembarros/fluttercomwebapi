import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountNumberController =
      TextEditingController();

  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome Completo',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Número da Conta',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: RaisedButton(
                child: Text('Criar'),
                onPressed: () {
                  final String name = _nameController.text;
                  final int accountNumber =
                      int.tryParse(_accountNumberController.text);
                  final Contact newContact = Contact(0, name, accountNumber);
                  _dao.save(newContact).then((id) => Navigator.pop(context));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
