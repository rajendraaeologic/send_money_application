import 'package:get/get.dart';
import 'package:send_money_application1/core/di/injection.dart';
import 'package:send_money_application1/data/sources/transaction_api.dart';
import 'package:send_money_application1/presentation/controllers/transaction_controller.dart';
import 'package:send_money_application1/presentation/pages/home_screen.dart';
import 'package:send_money_application1/presentation/pages/send_money_screen.dart';
import 'package:send_money_application1/presentation/pages/transaction_screen.dart';

import '../../data/repositories/transaction_repository_impl.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/usecases/get_transactions_usecase.dart';
import '../../presentation/controllers/home_controller.dart';
import '../../presentation/controllers/login_controller.dart';
import '../../presentation/controllers/send_money_controller.dart';
import '../../presentation/pages/login_screen.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';
  static const sendMoney = '/sendMoney';
  static const transactionHistory = '/transactionHistory';

  static final routes = [
    GetPage(
      name: login,
      page: () => LoginScreen(),
      binding: BindingsBuilder(() {
        Get.put(LoginController());
      }),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
      binding: BindingsBuilder(() {
        Get.put(HomeController());
      }),
    ),
    GetPage(
      name: sendMoney,
      page: () => SendMoneyScreen(),
      binding: BindingsBuilder(() {
        Get.put(SendMoneyController());
      }),
    ),
    GetPage(
      name: AppRoutes.transactionHistory, // Use the route constant
      page: () => TransactionsScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<TransactionAPI>(() => TransactionAPI());
        Get.lazyPut<TransactionRepository>(
            () => TransactionRepositoryImpl(locator<TransactionAPI>()));
        Get.lazyPut<GetTransactionsUseCase>(
            () => GetTransactionsUseCase(locator<TransactionRepository>()));
        Get.lazyPut<TransactionsController>(
            () => TransactionsController(locator<GetTransactionsUseCase>()));
      }),
    ),
  ];
}
