import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var isStudent = true.obs; // True for Student, False for Instructor

  // Controllers for text fields
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void updateRole(bool studentSelected) {
    isStudent.value = studentSelected;
  }

// Add validation and sign-up logic here
}
