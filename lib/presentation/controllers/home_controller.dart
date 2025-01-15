import 'package:get/get.dart';

class HomeController extends GetxController {

  var isBalanceVisible = false.obs;

  void toggleBalanceVisibility() {
    isBalanceVisible.value = !isBalanceVisible.value;
  }

}
