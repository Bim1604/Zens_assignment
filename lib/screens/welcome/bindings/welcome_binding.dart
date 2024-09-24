import 'package:get/get.dart';
import 'package:zens_assignment/screens/welcome/controllers/welcome_controller.dart';

class WelcomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
  }

}