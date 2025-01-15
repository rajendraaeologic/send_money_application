import '../../domain/entities/transaction.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../models/transaction_model.dart';
import '../sources/remote/transaction_api.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionAPI api;

  TransactionRepositoryImpl(this.api);

  @override
  Future<List<Transaction>> getTransactions() async {
    final transactionsData = await api.fetchTransactions();
    return transactionsData
        .map<Transaction>((json) => TransactionModel.fromJson(json))
        .toList();
  }
}
