import 'package:flutter/material.dart';

class LogoElement extends StatefulWidget {
  const LogoElement({super.key, required this.url});

  final String url;

  @override
  State<LogoElement> createState() => _LogoElementState();
}

class _LogoElementState extends State<LogoElement> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2500));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.centerLeft,  
          end: Alignment.centerRight,
          stops: [_animation.value, _animation.value],
          colors: const [
            Colors.white,
            Colors.transparent,
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: Center(
        child: Image.asset(
          widget.url,
          fit: BoxFit.contain,
          width: size.width * .5, 
          height: size.width * .5,
        ),
      ),
    );
  }
}