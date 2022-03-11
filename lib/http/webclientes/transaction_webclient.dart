import 'dart:convert';

import 'package:bytebank3/http/webclient.dart';
import 'package:bytebank3/models/contact.dart';
import 'package:bytebank3/models/transaction.dart';
import 'package:http/http.dart';


class TransactionWebClient {


  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(Uri.parse(baseUrl)).timeout(
        Duration(seconds: 15));
    // final Response response =
    //     // await client
    //     //     .get(Uri.parse('https://grupopodium.com.br/devsistemaspodium/api/transactions'));
    //     await client
    //         .get(Uri.http('192.168.100.51:8080', 'transactions'))
    //         .timeout(Duration(seconds: 15));
    // print(response.body.toString());

    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Transaction> transactions = List();
    for (Map<String, dynamic> transactionJson in decodedJson) {
      final Map<String, dynamic> contactJson = transactionJson['contact'];
      final Transaction transaction = Transaction(
        transactionJson['value'],
        Contact(
          0,
          contactJson['name'],
          contactJson['accountNumber'],
        ),
      );
      transactions.add(transaction);
    }
    return transactions;
    // print('DecodedJson: $decodedJson');
  }

  Future<Transaction> save(Transaction transaction) async {
    final Map<String, dynamic> transactionMap = {
      'value': transaction.value,
      'contact': {
        'name': transaction.contact.name,
        'accountNumber': transaction.contact.accountNumber,
      }
    };
    final String transactionJson = jsonEncode(transactionMap);

    final Response response = await client.post(Uri.parse(baseUrl),
        headers: {
          'Content-type': 'application/json',
          'password': '1000',
        },
        body: transactionJson);
    Map<String, dynamic> json = jsonDecode(response.body);
    final Map<String, dynamic> contactJson = json['contact'];
    return Transaction(
      json['value'],
      Contact(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );
  }

}