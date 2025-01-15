import 'dart:convert';

import 'package:http/http.dart' as http;

class TransactionAPI {
  final String _baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Map<String, dynamic>>> fetchTransactions() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception("Failed to load transactions");
    }
  }
}
