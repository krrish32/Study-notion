import 'package:edtec/ApiClient/Apis/auth.dart';
import 'package:edtec/ApiClient/Models/RequestModel/LoginRequestModel.dart';
import 'package:edtec/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Controllers for form fields
  final emailController = TextEditingController();
  var emailValue = "".obs;
  var password = "".obs;
  final passwordController = TextEditingController();
  var selectedRole = 'instructor'.obs;
  AuthRepository authRepository = AuthRepository();

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
    emailValue.value = value;
    return null;
  }

  // Validation logic for password
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password cannot be empty";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    password.value = value;
    return null;
  }

  // Function to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Method to validate and submit the form
  Future <void> login() async{
    if (formKey.currentState!.validate()) {
      try{
        LoginRequestModel loginRequestModel = LoginRequestModel(email: emailValue.value, password: password.value);
        var response = await authRepository.login(loginRequestModel);
        printLog("Login response $response");
      }
      catch(error){
        printLog(error);
      }
      Get.snackbar(
        "Success",
        "Logged in successfully!",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
