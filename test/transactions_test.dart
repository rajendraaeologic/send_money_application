

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:send_money_application1/domain/entities/transaction.dart';
import 'package:send_money_application1/domain/repositories/transaction_repository.dart';
import 'package:send_money_application1/domain/usecases/get_transactions_usecase.dart';
import 'package:send_money_application1/presentation/controllers/transaction_controller.dart';

import 'transactions_test.mocks.dart';

@GenerateMocks([TransactionRepository, GetTransactionsUseCase])
void main() {
  late MockGetTransactionsUseCase mockGetTransactionsUseCase;
  late TransactionsController transactionController;

  setUp(() {
    mockGetTransactionsUseCase = MockGetTransactionsUseCase();
    transactionController = TransactionsController(mockGetTransactionsUseCase);
  });

  group('TransactionController Tests', () {
    test('fetchTransactions should update transactions on success', () async {
      final mockTransactions = [
        Transaction(
            id: 1, title: "Transaction 1", body: "This is transaction 1"),
        Transaction(
            id: 2, title: "Transaction 2", body: "This is transaction 2"),
      ];

      when(mockGetTransactionsUseCase.call())
          .thenAnswer((_) async => mockTransactions);

      await transactionController.fetchTransactions();

      expect(transactionController.transactions, mockTransactions);
      expect(transactionController.errorMessage.value, '');
      verify(mockGetTransactionsUseCase.call()).called(1);
    });

    test('fetchTransactions should update errorMessage on failure', () async {
      const errorMessage = "Failed to fetch transactions";
      when(mockGetTransactionsUseCase.call())
          .thenThrow(Exception(errorMessage));
      await transactionController.fetchTransactions();
      expect(transactionController.errorMessage.value, errorMessage);
      expect(transactionController.transactions.isEmpty, true);
      verify(mockGetTransactionsUseCase.call()).called(1);
    });

    test('isLoading should toggle during fetchTransactions', () async {
      final mockTransactions = [
        Transaction(
            id: 1, title: "Transaction 1", body: "This is transaction 1"),
      ];
      when(mockGetTransactionsUseCase.call())
          .thenAnswer((_) async => mockTransactions);

      final future = transactionController.fetchTransactions();

      expect(transactionController.isLoading.value, true);

      await future;

      expect(transactionController.isLoading.value, false);
    });
  });
}
