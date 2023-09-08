import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/resources/color_manager.dart';
import 'package:portfolio/resources/font_manager.dart';
import 'package:portfolio/resources/values_manager.dart';
import 'package:portfolio/widget/text_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:responsive_framework/responsive_framework.dart' as res;

class Experience extends StatelessWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        bottom: AppPadding.p103,
        left: res.ResponsiveWrapper.of(context).isSmallerThan(res.TABLET)
            ? AppPadding.p20
            : MediaQuery.of(context).size.width * 0.18,
        right: res.ResponsiveWrapper.of(context).isSmallerThan(res.TABLET)
            ? AppPadding.p20
            : 0,
      ),
      child: SizedBox(
        height: size.height * 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            res.ResponsiveRowColumn(
              layout:
                  res.ResponsiveWrapper.of(context).isSmallerThan(res.DESKTOP)
                      ? res.ResponsiveRowColumnType.COLUMN
                      : res.ResponsiveRowColumnType.ROW,
              columnCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                res.ResponsiveRowColumnItem(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3.2),
                        child: TextWidget(
                          text: "02.",
                          fontSize: FontSize.s17,
                          color: ColorManager.primary,
                          fontWeight: FontWeightManager.light,
                          fontFamily: 'ibm',
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      TextWidget(
                        text: "Where I`ve Worked",
                        fontSize: FontSize.s18,
                        color: ColorManager.white,
                        fontWeight: FontWeightManager.bold,
                        fontFamily: 'jost',
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                res.ResponsiveRowColumnItem(
                  child: Container(
                    width: size.width / 8,
                    height: 0.22,
                    color: ColorManager.secondary,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppPadding.p12,
                    AppPadding.p37,
                    0,
                    0,
                  ),
                  child: SizedBox(
                    width: 500,
                    child: TextWidget(
                      height: 1.6,
                      color: ColorManager.secondary,
                      text:
                          "I`m  software  engineer  specializing  in  building  and  design  exceptional  digital  experience. Currently,  I`m  focused  on  building  accessible,  human-centered  product  about  mobile  application ",
                      fontSize: FontSize.s14,
                      fontFamily: "poppins",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppPadding.p12,
                    AppPadding.p24,
                    0,
                    0,
                  ),
                  child: SizedBox(
                    width: size.width / 2.8,
                    child: TextWidget(
                      height: 1.5,
                      color: ColorManager.primary,
                      text: "Scout Studio Developer",
                      fontSize: FontSize.s14,
                      fontFamily: "jost",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      AppPadding.p12, AppPadding.p12, 0, 0),
                  child: SizedBox(
                    width: size.width / 2.8,
                    child: TextWidget(
                      height: 1.5,
                      color: ColorManager.white,
                      text: "January 2022",
                      fontSize: FontSize.s14,
                      fontFamily: "jost",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.4),
              child: AnimatedSmoothIndicator(
                activeIndex: 1,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotColor: ColorManager.white,
                  dotHeight: 6,
                  dotWidth: 5,
                  activeDotColor: ColorManager.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    )
        .animate(delay: 200.ms)
        .slideX(duration: 600.ms, begin: 0.25)
        .fadeIn(duration: 1000.ms);
  }
}
