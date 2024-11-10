import 'package:edtec/res/app_colors.dart';
import 'package:edtec/res/app_images.dart';
import 'package:edtec/res/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/sign_up_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarBackgroundColor,
        title: Image.asset(AppImages.appLogoLight),
        centerTitle: true,
      ),
      backgroundColor: AppColors.primaryBackgroundColor, // Background of the screen
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height*0.01),
              const Text( AppStrings.signUpMainDesc,
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Build skills for today, tomorrow, and beyond.',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Education', // The "Education" part
                      style: TextStyle(
                        color: Colors.blueAccent, // Match the color of "Education"
                        fontWeight: FontWeight.bold,
                        fontSize: 18, // Adjust the font size to match the design
                      ),
                    ),
                    TextSpan(
                      text: ' to future-proof your career.', // The rest of the sentence
                      style: TextStyle(
                        color: Colors.white70, // Use a lighter color for the rest
                        fontSize: 16, // Smaller font size for the remaining text
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildRoleSelector(),
              SizedBox(height: 20),
              _buildForm(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Perform sign-up logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.yellow, // Button color
                  minimumSize: Size(double.infinity, 50), // Full width button
                ),
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleSelector() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildRoleButton('Student', controller.isStudent.value),
          _buildRoleButton('Instructor', !controller.isStudent.value),
        ],
      );
    });
  }

  Widget _buildRoleButton(String label, bool selected) {
    return GestureDetector(
      onTap: () {
        controller.updateRole(label == 'Student');
      },
      child: Container(
        decoration: BoxDecoration(
          color: selected ? Colors.yellow[700] : Colors.grey[850],
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.black : Colors.white70,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        _buildTextField('First Name', controller.firstNameController),
        SizedBox(height: 10),
        _buildTextField('Last Name', controller.lastNameController),
        SizedBox(height: 10),
        _buildTextField('Email Address', controller.emailController, keyboardType: TextInputType.emailAddress),
        SizedBox(height: 10),
        _buildPhoneField(),
        SizedBox(height: 10),
        _buildTextField('Create Password', controller.passwordController, obscureText: true),
        SizedBox(height: 10),
        _buildTextField('Confirm Password', controller.confirmPasswordController, obscureText: true),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool obscureText = false, TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.yellow),
        ),
        fillColor: Colors.grey[850],
        filled: true,
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildPhoneField() {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: '+91',
              labelStyle: TextStyle(color: Colors.white70),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white24),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.yellow),
              ),
              fillColor: Colors.grey[850],
              filled: true,
            ),
            style: TextStyle(color: Colors.white),
            readOnly: true,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _buildTextField('Phone Number', controller.phoneController, keyboardType: TextInputType.phone),
        ),
      ],
    );
  }
}
