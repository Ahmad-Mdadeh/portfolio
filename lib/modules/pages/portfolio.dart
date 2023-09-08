import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/resources/assets_manager.dart';
import 'package:portfolio/resources/color_manager.dart';
import 'package:portfolio/resources/font_manager.dart';
import 'package:portfolio/resources/values_manager.dart';
import 'package:portfolio/widget/portfolio_item_desktop.dart';
import 'package:portfolio/widget/portfolio_item_moile.dart';
import 'package:portfolio/widget/text_widget.dart';
import 'package:responsive_framework/responsive_framework.dart' as res;

class Portfolio extends StatelessWidget {
  Portfolio({Key? key}) : super(key: key);
  final List side = [
    true,
    false,
    true,
  ];
  final List image = [
    ImagesAssets.photo2,
    ImagesAssets.photo3,
    ImagesAssets.photo4,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        bottom: AppPadding.p270,
        left: res.ResponsiveWrapper.of(context).isSmallerThan(res.TABLET)
            ? AppPadding.p20
            : MediaQuery.of(context).size.width * 0.18,
        right: res.ResponsiveWrapper.of(context).isSmallerThan(res.TABLET)
            ? AppPadding.p20
            : 0,
      ),
      child: Column(
        children: [
          res.ResponsiveRowColumn(
            layout: res.ResponsiveWrapper.of(context).isSmallerThan(res.DESKTOP)
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
                        text: "03.",
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
                      text: "Some Things I`ve Build",
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
          )
              .animate()
              .slideX(duration: 600.ms, begin: 0.25)
              .fadeIn(duration: 1000.ms),
          res.ResponsiveVisibility(
            visible: true,
            hiddenWhen: const [res.Condition.smallerThan(name: res.DESKTOP)],
            child: SizedBox(
              height: size.height * 1.5,
              child: ListView.separated(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) => PortfolioItemDesktop(
                  isHovered: false.obs,
                  side: side[index],
                  image: image[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 60,
                ),
              ),
            ),
          ),
          res.ResponsiveVisibility(
            visible: false,
            visibleWhen: const [res.Condition.smallerThan(name: res.DESKTOP)],
            child: SizedBox(
              height: size.height * 3,
              child: ListView.separated(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) => PortfolioItemMobile(
                  isHovered: false.obs,
                  side: side[index],
                  image: image[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
