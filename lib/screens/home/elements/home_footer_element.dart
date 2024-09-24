import 'package:flutter/material.dart';
import 'package:zens_assignment/datas/app_color.dart';

class HomeFooterElement extends StatelessWidget {
  const HomeFooterElement({super.key, required this.copyWriteContent});

  final String copyWriteContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      margin: const EdgeInsets.only(top: 15.0, bottom: 5.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .2, color: AppColor.backgroundButtonColor),
          top: BorderSide(width: .2, color: AppColor.backgroundButtonColor),
        )
      ),
      child: Column(
        children: [
          Text(copyWriteContent, style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center,),
          const SizedBox(height: 5.0),
          Text("Copyright 2021 HLS", style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}