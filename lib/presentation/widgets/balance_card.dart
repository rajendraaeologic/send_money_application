import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:send_money_application1/core/routes/app_routes.dart';
import 'package:send_money_application1/core/utils/app_string.dart';
import 'package:send_money_application1/presentation/widgets/icon_action_button.dart';

import '../controllers/home_controller.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  final HomeController homeController; // Accept the controller as a parameter

  const BalanceCard({
    super.key,
    required this.balance,
    required this.homeController, // Pass the controller through constructor
  });

  @override
  Widget build(BuildContext context) {
    final formattedBalance =
        NumberFormat.decimalPattern('en_IN').format(balance);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 0.3,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                AppStrings.currentBalance,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              Obx(() {
                return Text(
                  homeController.isBalanceVisible.value
                      ? '₹$formattedBalance'
                      : '******',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                );
              }),
            ],
          ),
          IconButton(
            icon: Obx(() {
              return Icon(
                homeController.isBalanceVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.blue,
              );
            }),
            onPressed: () {
              homeController.toggleBalanceVisibility();
            },
          ),
          const Divider(thickness: 0.3),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconActionButton(
                  icon: Icons.arrow_upward_rounded,
                  label: AppStrings.sendMoney,
                  onTap: () {
                      Get.toNamed(AppRoutes.sendMoney);
                  }),
              IconActionButton(
                  icon: Icons.arrow_downward_rounded,
                  label: AppStrings.withdraw,
                  onTap: () {

                  }),
              IconActionButton(
                  icon: Icons.double_arrow_rounded,
                  label: AppStrings.transactions,
                  onTap: () {

                  }),
            ],
          ).paddingOnly(top: 8, bottom: 8)
        ],
      ),
    );
  }
}
