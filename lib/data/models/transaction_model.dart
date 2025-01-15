import '../../domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  TransactionModel({required super.id, required super.title, required super.body});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
