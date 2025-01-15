import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:send_money_application1/core/routes/app_routes.dart';
import 'package:send_money_application1/core/utils/app_string.dart';

import '../../core/utils/base_widget.dart';
import '../controllers/send_money_controller.dart';

class SendMoneyScreen extends StatelessWidget {
  final SendMoneyController controller = Get.find<SendMoneyController>();
  final TextEditingController amountController = TextEditingController();

  SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showBackButton: true,
      actions: [
        InkWell(
          onTap: () => Get.offAllNamed(AppRoutes.login),
          child: const Text(AppStrings.logout,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blue))
              .paddingOnly(right: 12),
        )
      ],
      appBarTitle: AppStrings.sendMoney,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(AppStrings.paying,
                style: TextStyle(fontWeight: FontWeight.w500)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppStrings.bankingName),
                Text(AppStrings.name,
                    style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
            const Text(AppStrings.mobile).paddingOnly(top: 16, bottom: 16),
             SizedBox(
              width: 180,
              child: TextField(
                controller: amountController,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                maxLength: 6,
                decoration: InputDecoration(
                  errorText: amountController.text.isEmpty ? 'Please enter an amount' : null, // Error handling
                  hintText: '0',
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  prefixIcon: const Icon(Icons.currency_rupee),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                  keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery
                  .sizeOf(context)
                  .width,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set the button color to blue
                ),
                onPressed: () {
                  if(amountController.text.isNotEmpty) {

                    showPaymentSuccessSheet();
                  }
                },
                child: const Text(
                    AppStrings.payNow, style: TextStyle(color: Colors.white)),
              ).paddingOnly(bottom: 20),
            ),
          ],
        ),
      ),
    );
  }

  void showPaymentSuccessSheet() {
    Get.bottomSheet(
      Container(
        height: 300,
        width: double.infinity,
        color: Colors.white, // Set the background color to white
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 50,
            ).paddingOnly(top: 12),
            const SizedBox(height: 16),
            const Text(
              AppStrings.successTile,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              AppStrings.successText,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.home); // Close the bottom sheet
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color
                    ),
                    child: const Text(
                      AppStrings.close,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ).paddingOnly(bottom: 8),
              ],
            ),
          ],
        ),
      ),
      isScrollControlled: false, // Allows the sheet to take as much height as needed
    );
  }
}
