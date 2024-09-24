import 'package:flutter/material.dart';

class ClickWidget extends StatelessWidget {
  final Function()? onTap;
  final Widget child;
  final Color? splashColor;
  final BorderRadius? radius;
  final bool isLock;
  final Function(TapDownDetails)? onTapDown;

  const ClickWidget(
      {super.key,
      this.onTap,
      this.isLock = false,
      required this.child,
      this.splashColor,
      this.onTapDown,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: splashColor ?? const Color(0xFFE5E5E5),
        borderRadius: radius,
        onTap: isLock ? null : () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Container(
          child: child,
        ),
      ),
    );
  }
}
