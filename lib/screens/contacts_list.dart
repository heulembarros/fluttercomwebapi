import 'package:bytebank3/components/centered_message.dart';
import 'package:bytebank3/components/progresse.dart';
import 'package:bytebank3/database/dao/contact_dao.dart';
import 'package:bytebank3/models/contact.dart';
import 'package:bytebank3/screens/contact_form.dart';
import 'package:bytebank3/screens/transaction_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final List<Contact> contacts = List();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransferĂȘncias'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: List(),
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progresse();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data;
              if (contacts.isNotEmpty) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];
                    return _ContactItem(
                      contact,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TransactionForm(contact),
                          ),
                        );
                      },
                    );
                  },
                  itemCount: contacts.length,
                );
              }
              return CenteredMessage(
                'Nenhuma contato foi encontrado!',
                icon: Icons.warning,
              );
              break;
          }
          return CenteredMessage('Erro Desconhecido');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContactForm()))
              .then(
                (value) => setState(() {}),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  _ContactItem(this.contact, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        leading: Icon(Icons.person, size: 48.0),
        title: Text(contact.name),
        subtitle: Text(contact.accountNumber.toString()),
      ),
    );
  }
}
