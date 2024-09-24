import 'package:flutter/material.dart';
import 'package:zens_assignment/components/button/click_widget_component.dart';
import 'package:zens_assignment/datas/app_color.dart';
import 'package:zens_assignment/utils/string_utils.dart';

class AppBarComponent extends StatefulWidget {
  final double? height;
  final PreferredSizeWidget? tabBar;
  final Function()? onLeftClick, onRightClick;
  final IconData? leftIcon, rightIcon;
  final String? avatar;

  const AppBarComponent({
    super.key,
    this.height = 50,
    this.tabBar,
    this.onLeftClick,
    this.onRightClick,
    this.leftIcon = Icons.arrow_back_ios,
    this.rightIcon,
    this.avatar,
  });

  @override
  State<AppBarComponent> createState() => _AppBarComponentState();
}

class _AppBarComponentState extends State<AppBarComponent> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double sizeLogo = size.width * .2;
    double sizeAvatar = size.width * .15;

    return PreferredSize(
      preferredSize: Size.fromHeight(widget.height!),
      child: SafeArea(
        child: Container(
          color: Colors.transparent,
          child: AppBar(
            elevation: 0.0,
            leading: Container(),
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset("assets/logos/logo_HLS.png", width: sizeLogo, height: sizeLogo),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Handicrafted by", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.right,),
                            Text("Jim HLS", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.right,),
                          ],
                        ),
                        const SizedBox(width: 5.0),
                        Visibility(
                          visible: !StringUtils.isNullOrWhite(widget.avatar),
                          child: ClickWidget(
                            splashColor: Colors.white54,
                            onTap: widget.onRightClick,
                            child: Container(
                              width: sizeAvatar, 
                              height: sizeAvatar,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(width: 1, color: AppColor.textSecondaryColor)
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(widget.avatar ?? "", fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            bottom: widget.tabBar,
          ),
        ),
      ),
    );
  }
}
