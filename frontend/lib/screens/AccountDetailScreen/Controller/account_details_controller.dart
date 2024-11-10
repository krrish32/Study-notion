import 'package:get/get.dart';

class AccountDetailController extends GetxController {
  // Current index for the BottomNavigationBar
  var currentIndex = 0.obs;

  // Update the index based on the tapped item
  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
