import 'package:flutter/material.dart';
import 'package:bytebank2/screens/contacts_list.dart';

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

          Padding(
            padding: const EdgeInsets.all(0),
            child: Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => ContactsList()
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 16.0),
                  height: 120,
                  width: 100,
                  color: Theme
                      .of(context)
                      .primaryColor,
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.people),
                      Text('Contatos'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

