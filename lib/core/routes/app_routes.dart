import 'package:get/get.dart';
import 'package:send_money_application1/presentation/pages/home_screen.dart';

import '../../presentation/controllers/home_controller.dart';
import '../../presentation/controllers/login_controller.dart';
import '../../presentation/pages/login_screen.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';

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
  ];
}