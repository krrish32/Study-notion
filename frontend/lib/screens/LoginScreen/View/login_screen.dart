import 'package:edtec/res/app_colors.dart';
import 'package:edtec/res/app_images.dart';
import 'package:edtec/screens/AccountDetailScreen/View/account_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../SignupScreen/View/sign_up_screen.dart';
import '../Controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImages.appLogoLight),
        backgroundColor: AppColors.appbarBackgroundColor,
        centerTitle: true,
      ),
      backgroundColor: AppColors.primaryBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Form(
            key: loginController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Back Text
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),

                // Subtitle Text
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Build skills for today, tomorrow, and beyond. ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: 'Education to future-proof your career.',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Toggle for Student/Instructor
                Obx(() => Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: AppColors.componentColor, // Outer background
                    borderRadius: BorderRadius.circular(30.0), // Rounded pill shape
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Student Button
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            loginController.selectedRole.value = 'student';
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: loginController.selectedRole.value == 'student'
                                  ? AppColors.primaryBackgroundColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Text(
                              'Student',
                              style: TextStyle(
                                color: loginController.selectedRole.value == 'student'
                                    ? Colors.white
                                    : AppColors.disableTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Instructor Button
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            loginController.selectedRole.value = 'instructor';
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: loginController.selectedRole.value == 'instructor'
                                  ? Colors.black
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Text(
                              'Instructor',
                              style: TextStyle(
                                color: loginController.selectedRole.value == 'instructor'
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),

                const SizedBox(height: 30),

                // Email Address Input
                const Text(
                  'Email Address*',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: loginController.emailController,
                  validator: (value) => loginController.validateEmail(value ?? ""),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[900],
                    hintText: 'Enter email address',
                    hintStyle: const TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),

                const SizedBox(height: 20),

                // Password Input
                const Text(
                  'Password*',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Obx(() => TextFormField(
                  controller: loginController.passwordController,
                  obscureText: !loginController.isPasswordVisible.value,
                  validator: (value) => loginController.validatePassword(value ?? ""),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[900],
                    hintText: 'Enter password',
                    hintStyle: const TextStyle(color: Colors.white54),
                    suffixIcon: IconButton(
                      icon: Icon(
                        loginController.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white54,
                      ),
                      onPressed: loginController.togglePasswordVisibility,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                )),

                const SizedBox(height: 10),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Add forgot password logic
                    },
                    child: const Text(
                      'Forgot password',
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Sign in Button
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        loginController.login();
                        Get.to(() => AccountDetailScreen()); // Trigger the validation and login function
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Sign up Text Button
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to the Sign-up page
                          Get.to(() => SignUpPage()); // Replace with your SignUpPage
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
