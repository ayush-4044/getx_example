import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_assessment/service/auth_service.dart';

class SplashController extends GetxController {
  final box = GetStorage();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(Duration(seconds: 3));
    final authService = Get.find<AuthService>();

    bool? isLoggedIn = box.read('isLoggedIn');
    print("Is User Logged In: $isLoggedIn");
    if (authService.isLoggedIn()) {
      Get.offAllNamed('/home');
    } else {
      Get.offAllNamed('/login');
    }
  }
}
