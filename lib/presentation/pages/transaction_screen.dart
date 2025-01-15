import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:send_money_application1/core/routes/app_routes.dart';
import 'package:send_money_application1/core/utils/app_string.dart';
import 'package:send_money_application1/presentation/controllers/home_controller.dart';
import 'package:send_money_application1/presentation/controllers/transaction_controller.dart';
import 'package:send_money_application1/presentation/widgets/balance_card.dart';
import '../../core/utils/base_widget.dart';

class TransactionsScreen extends StatelessWidget {
  final TransactionsController controller = Get.find<TransactionsController>();

  TransactionsScreen({super.key});

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
                .paddingOnly(right: 12))
      ],
      appBarTitle: AppStrings.transactionHistory,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              controller.errorMessage.value,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.transactions.length,
          itemBuilder: (context, index) {
            final transaction = controller.transactions[index];
            return ListTile(
              leading: CircleAvatar(child: Text(transaction.id.toString())),
              title: Text(transaction.title),
              subtitle: Text(transaction.body),
            );
          },
        );
      }),
    );
  }
}
