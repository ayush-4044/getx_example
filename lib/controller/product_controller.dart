import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController{
  final _box = GetStorage();

  var cartCount = 0.obs;
  var isDarkMode = false.obs;

  final List<Map<String, dynamic>> products = [
    {"name": "iPhone 15", "price": "79,000", "color": Colors.blue},
    {"name": "MacBook Air", "price": "1,79,000", "color": Colors.grey},
    {"name": "AirPods Pro", "price": "24,000", "color": Colors.amber},
    {"name": "Apple Watch", "price": "45,000", "color": Colors.black},
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isDarkMode.value =  _box.read('isDarkMode')??false;
  }

  void addToCart()=>cartCount.value++;

  void toggleTheme(bool value)
  {
      isDarkMode.value = value;
      Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
      _box.write('isDarkMode', value);
  }
  void logout()
  {
    _box.write('isLoggedIn', false);
    Get.offAllNamed('/login');
  }
}