import 'package:get/get.dart';

class MyProfileController extends GetxController {
  // Define the user profile data
  var firstName = 'Pranay'.obs;
  var lastName = 'Gupta'.obs;
  var email = 'pranay@thecodehelp.in'.obs;
  var phoneNumber = '(+91) 12345 67890'.obs;

  // Editing mode
  var isEditingProfile = false.obs;
  var isEditingDetails = false.obs;

  // Toggle edit mode for profile section
  void toggleProfileEdit() {
    isEditingProfile.value = !isEditingProfile.value;
  }

  // Toggle edit mode for personal details section
  void toggleDetailsEdit() {
    isEditingDetails.value = !isEditingDetails.value;
  }
}
