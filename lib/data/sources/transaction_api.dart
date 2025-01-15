import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:send_money_application1/domain/entities/transaction.dart';

class TransactionAPI {
  final String _baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<dynamic>> fetchTransactions() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load transactions");
    }
  }
}
