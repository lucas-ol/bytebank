import 'dart:convert';

import 'package:bytebank/Models/contact.dart';
import 'package:bytebank/Models/transaction.dart';
import "package:http/http.dart";
import 'package:http_interceptor/http_interceptor.dart';

final Uri baseUrl = Uri.parse("http://192.168.15.15:8080/transactions");
final client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

Future<List<Transaction>> findAllAsync() async {
  final Response response =
      await client.get(baseUrl).timeout(const Duration(seconds: 5));
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = [];
  for (Map<String, dynamic> transactionJson in decodedJson) {
    final transaction = Transaction(
      transactionJson["value"],
      Contact(
        0,
        transactionJson["contact"]["name"],
        transactionJson["contact"]["accountNumber"],
      ),
    );
    transactions.add(transaction);
  }
  return transactions;
}

Future save(Transaction transaction) async {
  final Map<String, dynamic> body = {
    'value': transaction.value,
    'contact': {
      'name': transaction.contact,
      'accountNumber': transaction.contact.accountNumber
    }
  };

  final String jsonEncoded = jsonEncode(body);
  final response = await client.post(baseUrl,
      headers: {
        'Content-type': 'application/json',
        'password': '1000',
      },
      body: jsonEncoded);
  final responseJson = JsonDecoder(response);
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('Request');
    print('url: ${data.url}');
    print('Headers ${data.headers}');
    print('Body ${data.body}');

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('Response');
    print('Status Code ${data.statusCode}');

    print('Headers ${data.headers}');
    print('Body ${data.body}');
    return data;
  }
}
