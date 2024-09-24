import 'package:get/get.dart';
import 'package:zens_assignment/screens/app/controllers/app_controller.dart';

class AppBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
  }

}