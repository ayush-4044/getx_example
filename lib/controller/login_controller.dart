import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  var isLoading = false.obs;

  void login(String email, String password) async {
    if (GetUtils.isEmail(email)) {
      isLoading.value = true;

      await Future.delayed(Duration(seconds: 1));

      box.write('isLoggedIn', true);
      print("Data saved: ${box.read('isLoggedIn')}");
      box.write("userEmail", email);

      Get.offAllNamed('/home');
    } else {
      Get.snackbar(
        "Error",
        "Invalid Email or Password",
        snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        duration: Duration(seconds: 1),
      );
    }
  }
}
