import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:send_money_application1/core/routes/app_routes.dart';
import 'package:send_money_application1/core/utils/app_string.dart';
import 'package:send_money_application1/presentation/controllers/home_controller.dart';
import 'package:send_money_application1/presentation/widgets/balance_card.dart';
import '../../core/utils/base_widget.dart';
import '../controllers/send_money_controller.dart';

class SendMoneyScreen extends StatelessWidget {
  final SendMoneyController controller = Get.find<SendMoneyController>();

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
            const Text(AppStrings.paying, style: TextStyle(fontWeight: FontWeight.w500)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppStrings.bankingName),
                Text(AppStrings.name, style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
            const Text(AppStrings.mobile).paddingOnly(top: 16, bottom: 16),
            const SizedBox(
              width: 180,
              child: TextField(
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: '0',
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  prefixIcon: Icon(Icons.currency_rupee),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set the button color to blue
                ),
                onPressed: () {

                },
                child: const Text(AppStrings.payNow, style: TextStyle(color: Colors.white)),
              ).paddingOnly(bottom: 20),
            ),
          ],
        ),
      ),
    );
  }
}
