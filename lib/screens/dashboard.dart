import 'package:bytebank3/screens/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:bytebank3/screens/contacts_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dashboard'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Image.asset('imagens/fundo1.png'),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _FeatureItem(
                  'Transferências',
                  Icons.monetization_on,
                  onClick: () {
                    _showContactList(context);
                  },
                ),
                _FeatureItem(
                  'Transações',
                  Icons.monetization_on,
                  onClick: () {
                    _showTransactionList(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showContactList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ContactsList()),
    );
  }

  void _showTransactionList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => TransactionsList()),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String nome;
  final IconData icone;
  final Function onClick;

  _FeatureItem(this.nome, this.icone, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
            height: 100,
            width: 120,
            color: Theme.of(context).primaryColor,
            child: Column(
              children: <Widget>[
                Icon(icone),
                Text(nome),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
