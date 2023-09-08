import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/resources/color_manager.dart';
import 'package:portfolio/resources/font_manager.dart';
import 'package:portfolio/resources/values_manager.dart';
import 'package:portfolio/widget/text_widget.dart';
import 'package:responsive_framework/responsive_framework.dart' as res;

class Intro extends StatelessWidget {
  Intro({Key? key}) : super(key: key);
  final RxBool isHovered = false.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: res.ResponsiveWrapper.of(context).isDesktop
            ? AppPadding.p240
            : AppPadding.p103,
        bottom: AppPadding.p400,
        left: res.ResponsiveWrapper.of(context).isSmallerThan(res.TABLET)
            ? AppPadding.p20
            : MediaQuery.of(context).size.width * 0.18,
        right: res.ResponsiveWrapper.of(context).isSmallerThan(res.TABLET)
            ? AppPadding.p20
            : 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            fontWeight: FontWeightManager.medium,
            color: ColorManager.primary,
            text: "Hi, my name is",
            fontSize: FontSize.s16,
            fontFamily: "ibm",
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 480,
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "AHMAD MDADEH",
                  textStyle: TextStyle(
                    color: ColorManager.white,
                    fontFamily: "black",
                    fontSize: FontSize.s50,
                    fontWeight: FontWeightManager.extraBold,
                  ),
                  speed: const Duration(
                    milliseconds: 155,
                  ),
                ),
              ],
              totalRepeatCount: 6,
              pause: const Duration(milliseconds: 2000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.only(right: AppPadding.p40),
            child: SizedBox(
              width: 600,
              child: TextWidget(
                height: 1.6,
                color: ColorManager.secondary,
                text:
                    "I`m software engineer specializing in building and design exceptional digital experience. Currently, I`m focused on building accessible, human-centered product about mobile application.",
                fontSize: FontSize.s14,
                fontFamily: "poppins",
              ),
            ),
          ),
          const SizedBox(
            height: 40,
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
                  isHovered.value ? -8.5 : 0,
                  0,
                ),
                child: Container(
                  width: 170,
                  height: 47,
                  decoration: BoxDecoration(
                    color: isHovered.value
                        ? ColorManager.button
                        : ColorManager.background,
                    borderRadius: BorderRadius.circular(
                      3.0,
                    ),
                    border: Border.all(
                      color: ColorManager.button,
                      width: 1.5,
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: TextWidget(
                      color:
                          isHovered.value ? Colors.white : ColorManager.primary,
                      fontFamily: "jost",
                      text: "Check out me item",
                      fontSize: FontSize.s13,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
