import 'package:edtec/res/app_colors.dart';
import 'package:edtec/screens/LoginScreen/View/login_screen.dart';
import 'package:edtec/screens/MyProfileScreen/View/my_profile_screen.dart';
import 'package:edtec/screens/SignupScreen/View/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'screens/AccountDetailScreen/View/account_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
