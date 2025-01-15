import '../../domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  TransactionModel({required super.id, required super.title, required super.body});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
