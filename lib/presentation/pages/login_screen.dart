import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/routes/app_routes.dart';
import '../../core/utils/app_string.dart';
import '../../core/utils/base_widget.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController controller = Get.find<LoginController>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: MediaQuery.of(context).size.height * 0.18),
        child: Column(
          children: [
            const Text(AppStrings.loginButton, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.text,
              maxLength: 10,
              decoration: const InputDecoration(labelText: AppStrings.emailLabel),
            ).paddingOnly(bottom: 16),
            Obx(
                  () {
                return TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  maxLength: 15,
                  obscureText: !controller.isPasswordVisible.value, // Use controller to toggle visibility
                  decoration: InputDecoration(
                    labelText: 'Password', // Replace with AppStrings.passwordLabel if needed
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.togglePasswordVisibility, // Toggle password visibility
                    ),
                  ),
                ).paddingOnly(bottom: 16);
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                elevation: 0,
              ),
              onPressed: () {
                Get.toNamed(AppRoutes.home);
              },
              child: const Text(AppStrings.loginButton, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}