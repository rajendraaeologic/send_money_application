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

  void fetchTransactions() async {
    try {
      isLoading.value = true;
      transactions.value = await getTransactionsUseCase.call();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
