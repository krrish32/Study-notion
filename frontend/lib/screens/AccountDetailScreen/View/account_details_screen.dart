import 'package:edtec/res/app_colors.dart';
import 'package:edtec/screens/EnrolledCourseScreen/View/enrolled_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../MyProfileScreen/View/my_profile_screen.dart';
import '../../PurchaseHistoryScreen/View/purchase_history_screen.dart';
import '../../WatchlistScreen/View/watchlist_screen.dart';
import '../Controller/account_details_controller.dart';

class AccountDetailScreen extends StatefulWidget {
  const AccountDetailScreen({super.key});

  @override
  State<AccountDetailScreen> createState() => _AccountDetailScreenState();
}

class _AccountDetailScreenState extends State<AccountDetailScreen> {
  final AccountDetailController accountController = Get.put(AccountDetailController());

  // Titles for the AppBar corresponding to each BottomNavigationBar item
  final List<String> _appBarTitles = [
    'Enrolled Courses',
    'Watchlist',
    'Purchase History',
    'My Profile',

  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.primaryBackgroundColor,
        appBar: AppBar(
          backgroundColor:AppColors.appbarBackgroundColor,
          title: Text(
            _appBarTitles[accountController.currentIndex.value],
            style: TextStyle(color: AppColors.appBarColor),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IndexedStack(
            index: accountController.currentIndex.value,
            children: [
              EnrolledCoursesScreen(),  // Placeholder for enrolled courses screen
              WatchlistScreen(),        // Placeholder for watchlist screen
              const PurchaseHistoryScreen(),  // Placeholder for purchase history screen
              const MyProfileScreen(),
              //CoursesScreen(),          // Placeholder for courses screen
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: accountController.currentIndex.value,
          onTap: accountController.updateIndex,
          type: BottomNavigationBarType.fixed, // Fixes the icon shifting issue
          backgroundColor: AppColors.appbarBackgroundColor,
          selectedItemColor:AppColors.yellow,
          unselectedItemColor: Colors.white70,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Enrolled Courses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.watch_later),
              label: 'Watchlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My Profile',
            ),

            // BottomNavigationBarItem(
            //   icon: Icon(Icons.library_books),
            //   label: 'Courses',
            // ),
          ],
        ),
      );
    });
  }
}
