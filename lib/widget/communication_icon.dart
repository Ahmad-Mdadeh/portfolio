import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunicationIcon extends StatelessWidget {
  final IconData iconData;
  final RxBool isHovered;
  final VoidCallback onTap;
  final Color normalColor;
  final Color hoverColor;
  final double size;

  const CommunicationIcon(
      {required this.iconData,
      required this.isHovered,
      required this.onTap,
      required this.normalColor,
      required this.hoverColor,
      this.size = 25.0,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MouseRegion(
        onEnter: (_) {
          isHovered.value = true;
        },
        onExit: (_) {
          isHovered.value = false;
        },
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: Icon(
            iconData,
            color: isHovered.value ? hoverColor : normalColor,
            size: size,
          ),
        ),
      ),
    );
  }
}
