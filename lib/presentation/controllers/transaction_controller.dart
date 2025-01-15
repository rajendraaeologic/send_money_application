import 'package:get/get.dart';

import '../../domain/entities/transaction.dart';
import '../../domain/usecases/get_transactions_usecase.dart';

class TransactionsController extends GetxController {
  final GetTransactionsUseCase getTransactionsUseCase;

  TransactionsController(this.getTransactionsUseCase);

  var transactions = <Transaction>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTransactions();
  }

  Future<void> fetchTransactions() async {
    try {
      isLoading.value = true;
      final fetchedTransactions = await getTransactionsUseCase.call();
      transactions.value = fetchedTransactions;
    } catch (e) {
      errorMessage.value = e.toString().replaceFirst('Exception: ', '').trim();
    } finally {
      isLoading.value = false;
    }
  }
}
