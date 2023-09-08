import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/resources/values_manager.dart';
import 'package:portfolio/widget/contact_button.dart';
import 'package:portfolio/widget/item_appbar.dart';
import 'package:responsive_framework/responsive_framework.dart' as res;

class AppBarTitle extends StatelessWidget {
  AppBarTitle({Key? key}) : super(key: key);
  final RxBool isHoveredH = false.obs;
  final RxBool isHoveredA = false.obs;
  final RxBool isHoveredE = false.obs;
  final RxBool isHoveredP = false.obs;
  final RxBool isHoveredC = false.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: AppPadding.p87,
        left: res.ResponsiveWrapper.of(context).isSmallerThan(res.TABLET)
            ? AppPadding.p20
            : AppPadding.p40,
        top: res.ResponsiveWrapper.of(context).isSmallerThan(res.TABLET)
            ? 0
            : 20,
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/A.png",
            scale: 1.2,
          ),
          const Spacer(),
          res.ResponsiveVisibility(
            hiddenWhen: const [res.Condition.smallerThan(name: res.TABLET)],
            child: Row(
              children: [
                ItemAppBar(
                  index: 0,
                  num: "00.",
                  string: "Hello",
                  isHovered: isHoveredH,
                ),
                const SizedBox(
                  width: AppSize.s34,
                ),
                ItemAppBar(
                  index: 1,
                  num: "01.",
                  string: "About",
                  isHovered: isHoveredA,
                ),
                const SizedBox(
                  width: AppSize.s34,
                ),
                ItemAppBar(
                  index: 2,
                  num: "02.",
                  string: "Experience",
                  isHovered: isHoveredE,
                ),
                const SizedBox(
                  width: AppSize.s34,
                ),
                ItemAppBar(
                  index: 3,
                  num: "03.",
                  string: "Portfolio",
                  isHovered: isHoveredP,
                ),
                const SizedBox(
                  width: AppSize.s40,
                ),
                ContactButton(
                  index: 4,
                  isHovered: isHoveredC,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
