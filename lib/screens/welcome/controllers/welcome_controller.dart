import 'package:get/get.dart';
import 'package:zens_assignment/routers/app_router.dart';
import 'package:zens_assignment/screens/app/controllers/app_controller.dart';

class WelcomeController extends GetxController {

  RxString imageString = "".obs;
  AppController appController = Get.find();

  @override
  void onInit() {
    super.onInit();
    initImage();
  }

  void initImage() {
    imageString.value = "assets/logos/logo.jfif";
  }

  @override
  void onReady() {
    loadDataBackground();
    super.onReady();
  }

  Future<void> loadDataBackground() async {
    Future.delayed( const Duration(milliseconds: 3500),(){
      Get.toNamed(AppRouter.main);
    });
  }
}