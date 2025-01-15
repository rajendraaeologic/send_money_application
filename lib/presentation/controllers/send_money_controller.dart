import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SendMoneyController extends GetxController {
  final TextEditingController amountController = TextEditingController();

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }
}
