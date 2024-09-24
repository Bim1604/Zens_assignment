import 'package:flutter/material.dart';
import 'package:zens_assignment/components/button/click_widget_component.dart';
import 'package:zens_assignment/datas/app_color.dart';

class ButtonComponent extends StatefulWidget {
  final String title;
  final double? width;
  final double? height;
  final Alignment? alignment;
  final Color? backgroundColor;
  final Function()? onTap;
  final bool isLock;

  const ButtonComponent(
      {super.key,
      required this.title,
      this.width,
      this.height,
      this.alignment,
      this.backgroundColor,
      this.onTap,
      this.isLock = false});

  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {

  Color getBackgroundColor() {
    if (widget.isLock) return AppColor.backgroundButtonColor;
    if (widget.backgroundColor != null) return widget.backgroundColor!;
    return Theme.of(context).colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        color: getBackgroundColor()
      ),
      child: ClickWidget(
        isLock: widget.isLock,
        onTap: () {
          if (widget.onTap != null && !widget.isLock) {
            widget.onTap!();
          }
        },
        child: Container(
          width: widget.width ?? size.width,
          alignment: widget.alignment,
          height: widget.height ?? 40,
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
