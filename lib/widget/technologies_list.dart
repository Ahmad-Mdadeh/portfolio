import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/resources/color_manager.dart';
import 'package:portfolio/resources/font_manager.dart';
import 'package:portfolio/resources/values_manager.dart';
import 'package:portfolio/widget/text_widget.dart';
import 'package:responsive_framework/responsive_framework.dart' as res;

class TechnologiesList extends StatelessWidget {
  final String technology;
  final String technology2;
  final double width;

  const TechnologiesList({
    super.key,
    required this.technology,
    required this.technology2,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return res.ResponsiveRowColumn(
      columnCrossAxisAlignment: CrossAxisAlignment.end,
      layout: res.ResponsiveWrapper.of(context).isSmallerThan(res.TABLET)
          ? res.ResponsiveRowColumnType.COLUMN
          : res.ResponsiveRowColumnType.ROW,
      rowPadding: const EdgeInsets.only(left: AppPadding.p40),
      children: [
        res.ResponsiveRowColumnItem(
          child: Row(
            children: [
              Icon(
                EvaIcons.arrowRight,
                color: ColorManager.primary,
              ),
              const SizedBox(
                width: 8,
              ),
              TextWidget(
                text: technology,
                fontSize: FontSize.s16,
                color: ColorManager.secondary,
                fontFamily: "poppins",
              ),
            ],
          ),
        ),
        res.ResponsiveRowColumnItem(
          child: SizedBox(
            width: width,
          ),
        ),
        res.ResponsiveRowColumnItem(
          child: Row(
            children: [
              Icon(
                EvaIcons.arrowRight,
                color: ColorManager.primary,
              ),
              const SizedBox(
                width: 8,
              ),
              TextWidget(
                text: technology2,
                fontSize: FontSize.s16,
                color: ColorManager.secondary,
                fontFamily: "poppins",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
