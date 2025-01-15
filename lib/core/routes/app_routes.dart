import 'package:get/get.dart';

import '../../presentation/controllers/login_controller.dart';
import '../../presentation/pages/login_screen.dart';

class AppRoutes {
  static const login = '/login';

  static final routes = [
    GetPage(
      name: login,
      page: () => LoginScreen(),
      binding: BindingsBuilder(() {
        Get.put(LoginController());
      }),
    ),
  ];
}