import 'package:get/get.dart';

class WatchlistController extends GetxController {
  // List of courses in the watchlist
  var courses = [
    {
      'title': 'The Complete Python Bootcamp From Zero to Hero in Python',
      'rating': 4.5,
      'reviewCount': 5000,
      'totalCourses': 'Total Courses',
      'lesson': 'Lesson',
      'level': 'Beginner',
      'price': 1700,
    },
    {
      'title': 'The Complete Python Bootcamp From Zero to Hero in Python',
      'rating': 4.5,
      'reviewCount': 5000,
      'totalCourses': 'Total Courses',
      'lesson': 'Lesson',
      'level': 'Beginner',
      'price': 2100,
    },
    {
      'title': 'The Complete Python Bootcamp From Zero to Hero in Python',
      'rating': 4.5,
      'reviewCount': 5000,
      'totalCourses': 'Total Courses',
      'lesson': 'Lesson',
      'level': 'Beginner',
      'price': 2000,
    },
  ].obs;

  // Method to remove a course from the list
  void removeCourse(int index) {
    courses.removeAt(index);
  }

  // Get the total price
  int get totalPrice => courses.fold(0, (int sum, course) => sum + (course['price'] as int));
}
