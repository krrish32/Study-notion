import 'package:get/get.dart';

class EnrolledCoursesController extends GetxController {
  var selectedTab = 0.obs; // 0 for All, 1 for Pending, 2 for Completed
  var courses = <CourseModel>[
    CourseModel('The Complete Python', 'Short Description', '2hr 30 mins', 85),
    CourseModel('The Complete Python', 'Short Description', '2hr 30 mins', 20),
    CourseModel('The Complete Python', 'Short Description', '2hr 30 mins', 80),
    CourseModel('The Complete Python', 'Short Description', '2hr 30 mins', 100),
  ].obs;

  void updateTab(int index) {
    selectedTab.value = index;
  }

  // Filter courses based on the selected tab
  List<CourseModel> get filteredCourses {
    if (selectedTab.value == 1) {
      return courses.where((course) => course.progress < 100).toList();
    } else if (selectedTab.value == 2) {
      return courses.where((course) => course.progress == 100).toList();
    }
    return courses;
  }
}

class CourseModel {
  String name;
  String description;
  String duration;
  int progress;

  CourseModel(this.name, this.description, this.duration, this.progress);
}
