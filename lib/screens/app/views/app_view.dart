import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zens_assignment/datas/app_config.dart';
import 'package:zens_assignment/routers/app_router.dart';
import 'package:zens_assignment/routers/page_router.dart';
import 'package:zens_assignment/screens/app/bindings/app_binding.dart';
import 'package:zens_assignment/screens/app/controllers/app_controller.dart';

class AppScreen extends GetWidget<AppController>{

  const AppScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Zens assignment",
      color: Colors.transparent,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      initialBinding: AppBinding(),
      initialRoute: AppRouter.welcome,
      getPages: AppPages.list,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        colorScheme: AppConfig.colorScheme,
        textTheme: AppConfig.textTheme
      ),
    );
  }
}