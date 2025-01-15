import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:send_money_application1/presentation/controllers/home_controller.dart';
import '../../core/utils/base_widget.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showBackButton: false,
      appBarTitle: 'Money Pay',
      body: Container(),
    );
  }
}