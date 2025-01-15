import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:send_money_application1/core/routes/app_routes.dart';
import 'package:send_money_application1/core/utils/app_string.dart';
import 'package:send_money_application1/presentation/controllers/home_controller.dart';
import '../../core/utils/base_widget.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showBackButton: false,
      actions: [
        InkWell(
            onTap: () => Get.offAllNamed(AppRoutes.login),
            child: const Text(AppStrings.logout,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue))
                .paddingOnly(right: 12))
      ],
      appBarTitle: 'Money Pay',
      body: Container(),
    );
  }
}
