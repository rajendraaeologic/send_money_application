import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

import '../../models/transaction_model.dart';
import '../local/database_helper.dart';

class TransactionAPI {

  final String _baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Map<String, dynamic>>> fetchTransactions() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      return await DatabaseHelper.fetchTransactions();
    } else {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> transactionsData = json.decode(response.body);
        await _saveTransactionsToLocalDb(transactionsData);
        return List<Map<String, dynamic>>.from(json.decode(response.body));

      } else {
        throw Exception("Failed to load transactions from the network.");
      }
    }
  }

  Future<void> _saveTransactionsToLocalDb(List<dynamic> transactionsData) async {
    for (var transactionJson in transactionsData) {
      final transaction = TransactionModel.fromJson(transactionJson);
      await DatabaseHelper.insertTransaction(transaction.toJson());
    }
  }
}
