import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zens_assignment/components/appbar/app_bar_component.dart';
import 'package:zens_assignment/screens/home/controllers/home_controller.dart';
import 'package:zens_assignment/screens/home/elements/home_body_element.dart';
import 'package:zens_assignment/screens/home/elements/home_footer_element.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {    
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(85),
            child: Obx(() => AppBarComponent(
              avatar: controller.avatar.value,
            )),
          ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() => HomeBodyElement(
                jokeContent: controller.currentJoke.value.getJokeContent(),
                isLoading: controller.isLoading.value,
                onRateJoke: (rate) {
                  controller.onRateJoke(rate);
                },
                outOfJoke: controller.data.isEmpty,
              )),
            ),
            Obx(() => HomeFooterElement(
              copyWriteContent: controller.copyWriteContent.value,
            )),
          ],
        ),
      ),
    );
  }

}