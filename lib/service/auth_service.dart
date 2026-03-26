import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService
{
  final box = GetStorage();

  bool isLoggedIn()
  {
    return box.read("isLoggedIn")?? false;  
  }
}