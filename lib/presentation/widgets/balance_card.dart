import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:send_money_application1/core/utils/app_string.dart';

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
    return Container(
      padding: const EdgeInsets.all(16.0), // Padding around the content
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(5), // Rounded corners with radius
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0), // Padding around the icon
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.currency_rupee_outlined,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                return Text(
                  homeController.isBalanceVisible.value
                      ? balance.toStringAsFixed(0)
                      : '******',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                );
              }),
              const Text(
                AppStrings.currentBalance,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey
                ),
              ),
            ],
          ),
          Row(children: [
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
          ],)
        ],
      ),
    );
  }
}
