import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/app_colors.dart';
import '../Controller/enrolled_course_controller.dart';

class EnrolledCoursesScreen extends StatefulWidget {
  @override
  State<EnrolledCoursesScreen> createState() => _EnrolledCoursesScreenState();
}

class _EnrolledCoursesScreenState extends State<EnrolledCoursesScreen> {
  final EnrolledCoursesController controller = Get.put(EnrolledCoursesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.start ,
        children: [
          _buildTabBar(),
          const Divider(
            color: AppColors.appbarBackgroundColor,
            height: 20,
          ),
          Expanded(child: Obx(() => _buildCourseList())),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Obx(() {
      return Container(
        child: Row(
          children: [
            _buildTabItem(0, 'All'),
            _buildTabItem(1, 'Pending'),
            _buildTabItem(2, 'Completed'),
          ],
        ),
      );
    });
  }

  Widget _buildTabItem(int index, String label) {
    return GestureDetector(
      onTap: () => controller.updateTab(index),
      child: Container(
        color: controller.selectedTab.value == index
            ? AppColors.appbarBackgroundColor
            : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Text(
            label,
            style: TextStyle(
              color: controller.selectedTab.value == index ? AppColors.appBarColor : AppColors.lightTextColor,
              fontWeight: controller.selectedTab.value == index ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseList() {
    var filteredCourses = controller.filteredCourses;
    return ListView.builder(
      itemCount: filteredCourses.length,
      itemBuilder: (context, index) {
        var course = filteredCourses[index];
        return _buildCourseCard(course);
      },
    );
  }

  Widget _buildCourseCard(CourseModel course) {
    return Card(
      color:AppColors.componentColor,
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: ListTile(
        leading: Image.asset('assets/images/course_thumbnail.jpg'), // Placeholder for course thumbnail
        title: Text(course.name, style: TextStyle(color: Colors.white)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Text(course.description, style: TextStyle(color: Colors.white70)),
            Text(course.duration, style: TextStyle(color: Colors.white70)),
            SizedBox(height: 8),
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(20.0),
              value: course.progress / 100,
              backgroundColor: Colors.white24,
              color: course.progress == 100 ?AppColors.completeProgressColor : AppColors.pendingProgressColor,
            ),
            SizedBox(height: 4),
            Text('Progress: ${course.progress}%', style: TextStyle(color: Colors.white70)),
          ],
        ),
        trailing: _buildPopupMenu(),
      ),
    );
  }

  Widget _buildPopupMenu() {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert, color: Colors.white70),
      onSelected: (value) {
        if (value == 'Mark as Completed') {
          // Mark course as completed logic
        } else if (value == 'Remove') {
          // Remove course logic
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(value: 'Mark as Completed', child: Text('Mark as Completed')),
        PopupMenuItem(value: 'Remove', child: Text('Remove')),
      ],
    );
  }
}
