import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/resources/assets_manager.dart';
import 'package:portfolio/resources/color_manager.dart';
import 'package:portfolio/resources/font_manager.dart';
import 'package:portfolio/resources/values_manager.dart';
import 'package:portfolio/widget/technologies_list.dart';
import 'package:portfolio/widget/text_widget.dart';
import 'package:responsive_framework/responsive_framework.dart' as res;

class About extends StatelessWidget {
  About({Key? key}) : super(key: key);
  final RxBool isHovered = false.obs;
  final List technologiesName = [
    "Flutter",
    "Flutter",
    "Flutter",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: AppPadding.p400,
        left: res.ResponsiveWrapper.of(context).isSmallerThan(res.TABLET)
            ? AppPadding.p20
            : MediaQuery.of(context).size.width * 0.18,
        right: res.ResponsiveWrapper.of(context).isSmallerThan(res.TABLET)
            ? AppPadding.p20
            : 0,
      ),
      child: res.ResponsiveRowColumn(
        layout: res.ResponsiveWrapper.of(context).isSmallerThan(res.DESKTOP)
            ? res.ResponsiveRowColumnType.COLUMN
            : res.ResponsiveRowColumnType.ROW,
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          res.ResponsiveRowColumnItem(
            child: SizedBox(
              width: 480,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3.2),
                        child: TextWidget(
                          text: "01.",
                          fontSize: FontSize.s18,
                          color: ColorManager.primary,
                          fontWeight: FontWeightManager.light,
                          fontFamily: 'ibm',
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      TextWidget(
                        text: "About Me",
                        fontSize: FontSize.s19,
                        color: ColorManager.white,
                        fontWeight: FontWeightManager.bold,
                        fontFamily: 'jost',
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 8,
                        height: 0.22,
                        color: ColorManager.secondary,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  SizedBox(
                    width: 550,
                    child: TextWidget(
                      wordSpacing: 8,
                      height: 1.6,
                      color: ColorManager.secondary,
                      text:
                          "I`m software engineer specializing in building and design exceptional digital experience. Currently, I`m focused on building accessible, human-centered product about mobile application",
                      fontSize: FontSize.s16,
                      fontFamily: "poppins",
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  SizedBox(
                    width: 550,
                    child: TextWidget(
                      height: 1.6,
                      wordSpacing: 8,
                      color: ColorManager.secondary,
                      text:
                          "software engineer specializing in building and design exceptional digital experience. Currently, I`m focused on building accessible, human-centered product about mobile application centered product about mobile.",
                      fontSize: FontSize.s16,
                      fontFamily: "poppins",
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  res.ResponsiveRowColumn(
                    layout: res.ResponsiveWrapper.of(context)
                            .isSmallerThan(res.DESKTOP)
                        ? res.ResponsiveRowColumnType.COLUMN
                        : res.ResponsiveRowColumnType.ROW,
                    children: [
                      res.ResponsiveRowColumnItem(
                        child: TextWidget(
                          height: 1.7,
                          color: ColorManager.secondary,
                          text: "I build  ",
                          fontSize: FontSize.s16,
                          fontFamily: "poppins",
                        ),
                      ),
                      res.ResponsiveRowColumnItem(
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            TyperAnimatedText(
                              "awesome website",
                              textStyle: TextStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s16,
                              ),
                              speed: const Duration(
                                milliseconds: 120,
                              ),
                            ),
                          ],
                          pause: const Duration(milliseconds: 2000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 550,
                    child: TextWidget(
                      height: 1.7,
                      color: ColorManager.secondary,
                      text:
                          "Hera are a few technologies l`ve been working with\nrecently : ",
                      fontSize: FontSize.s16,
                      fontFamily: "poppins",
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  ...List.generate(
                    3,
                    (index) => TechnologiesList(
                      technology: technologiesName[index],
                      technology2: technologiesName[index],
                      width: 120,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const res.ResponsiveRowColumnItem(
            child: SizedBox(
              width: 50,
            ),
          ),
          res.ResponsiveRowColumnItem(
            child: Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.p95,
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 20,
                    ),
                    child: Container(
                      width: 326,
                      height: 348,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        border: Border.all(
                          color: ColorManager.primary,
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => MouseRegion(
                      onEnter: (event) {
                        isHovered.value = true;
                      },
                      onExit: (event) {
                        isHovered.value = false;
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 260),
                        transform: Matrix4.translationValues(
                          0,
                          isHovered.value ? -9 : 0,
                          0,
                        ),
                        child: Container(
                          width: 326,
                          height: 340,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                            image: const DecorationImage(
                              image: AssetImage(
                                ImagesAssets.photo,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: !isHovered.value
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    8.0,
                                  ),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 0.1,
                                      sigmaY: 0.1,
                                    ),
                                    child: Container(
                                      color: ColorManager.primaryA,
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )
        .animate(delay: 200.ms)
        .slideX(duration: 600.ms, begin: 0.25)
        .fadeIn(duration: 1000.ms);
  }
}
