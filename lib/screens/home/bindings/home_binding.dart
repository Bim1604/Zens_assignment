import 'package:get/get.dart';
import 'package:zens_assignment/screens/home/controllers/home_controller.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }

}