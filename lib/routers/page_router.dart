
import 'package:get/get.dart';
import 'package:zens_assignment/routers/app_router.dart';
import 'package:zens_assignment/screens/home/bindings/home_binding.dart';
import 'package:zens_assignment/screens/home/views/home_view.dart';
import 'package:zens_assignment/screens/welcome/bindings/welcome_binding.dart';
import 'package:zens_assignment/screens/welcome/welcome_view.dart';

class AppPages{
  static var list =[
    GetPage(
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
      name: AppRouter.main,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
      name: AppRouter.welcome,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
  ];
}