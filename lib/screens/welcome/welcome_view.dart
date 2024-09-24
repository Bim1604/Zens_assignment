import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zens_assignment/screens/welcome/controllers/welcome_controller.dart';
import 'package:zens_assignment/screens/welcome/elements/logo_element.dart';

class WelcomeView extends GetWidget<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20.0),
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        height: size.height,
        width: size.width,
        child: Obx(() => LogoElement(url: controller.imageString.value))
      ),
    );
  }

}