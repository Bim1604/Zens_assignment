
import 'package:flutter/material.dart';
import 'package:zens_assignment/components/button/button_component.dart';
import 'package:zens_assignment/datas/app_color.dart';
import 'package:zens_assignment/datas/app_type.dart';

class HomeBodyElement extends StatelessWidget {
  const HomeBodyElement({super.key, required this.jokeContent, required this.onRateJoke, this.outOfJoke = false});

  final String jokeContent;
  final Function(JokeType) onRateJoke;
  final bool outOfJoke;

  String getJokeContent() {
    String result = jokeContent;
    if (outOfJoke) {
      result = '''That's all the jokes for today! Come back another day!''';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
           width: size.width,
           height: size.height * .15,
           decoration: BoxDecoration(
             color: Theme.of(context).colorScheme.primary,
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               const SizedBox(height: 15.0),
               Text("A joke a day keeps the doctor away", style: Theme.of(context).textTheme.displayMedium, textAlign: TextAlign.center),
               Text("If you joke wrong way, your teeth have to pay.(Serious)", style: Theme.of(context).textTheme.displaySmall, textAlign: TextAlign.center),
               const SizedBox(height: 15.0),
             ],
           ),
         ),
         Expanded(
            child: Container(
            padding: const EdgeInsets.fromLTRB(20.0,30.0,20.0,10.0),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Text(getJokeContent(), style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.left))
            ) 
         ),
         Visibility(
           visible: !outOfJoke,
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25.0),
             child: Row(
               children: [
                 Expanded(
                   child: ButtonComponent(
                     title: "This is Funny!",
                     onTap: (){
                       onRateJoke(JokeType.like);
                     },
                     backgroundColor: AppColor.primaryBlueColor,
                     alignment: Alignment.center,
                   ),
                 ),
                 const SizedBox(width: 30.0),
                 Expanded(
                   child: ButtonComponent(
                     title: "This is not funny.",
                     onTap: (){
                       onRateJoke(JokeType.dislike);
                     },
                     alignment: Alignment.center,
                   ),
                 ),
               ],
             ),
           ),
         ),
      ],
    );
  }
}