import 'package:get_it/get_it.dart';

import '../../data/repositories/transaction_repository_impl.dart';
import '../../data/sources/local/database_helper.dart';
import '../../data/sources/remote/transaction_api.dart';
import '../../domain/usecases/get_transactions_usecase.dart';
import '../../presentation/controllers/transaction_controller.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<TransactionAPI>(() => TransactionAPI());
  locator.registerLazySingleton<TransactionRepositoryImpl>(
      () => TransactionRepositoryImpl(locator<TransactionAPI>()));
  locator.registerLazySingleton<GetTransactionsUseCase>(
      () => GetTransactionsUseCase(locator<TransactionRepositoryImpl>()));
  locator.registerFactory(
      () => TransactionsController(locator<GetTransactionsUseCase>()));
}
