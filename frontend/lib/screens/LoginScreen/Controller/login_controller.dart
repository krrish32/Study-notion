import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Controllers for form fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var selectedRole = 'instructor'.obs;

  // Key for Form widget
  final formKey = GlobalKey<FormState>();

  // Variables to control the visibility of password
  var isPasswordVisible = false.obs;

  // Validation logic for email
  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email cannot be empty";
    } else if (!GetUtils.isEmail(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  // Validation logic for password
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password cannot be empty";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  // Function to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Method to validate and submit the form
  void login() {
    if (formKey.currentState!.validate()) {
      // If all validations pass, perform the login operation
      Get.snackbar(
        "Success",
        "Logged in successfully!",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
