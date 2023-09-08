import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/modules/home/home_controller.dart';
import 'package:portfolio/resources/color_manager.dart';
import 'package:portfolio/resources/font_manager.dart';
import 'package:portfolio/widget/text_widget.dart';
import 'package:responsive_framework/responsive_framework.dart' as res;

class LeftBar extends StatelessWidget {
  LeftBar({Key? key}) : super(key: key);
  final RxBool isHoveredE = false.obs;
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return res.ResponsiveVisibility(
      visible: true,
      hiddenWhen: const [res.Condition.smallerThan(name: res.TABLET)],
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MouseRegion(
              onEnter: (event) {
                isHoveredE.value = true;
              },
              onExit: (event) {
                isHoveredE.value = false;
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1),
                transform: Matrix4.translationValues(
                  isHoveredE.value ? 1.7 : 0,
                  0,
                  0,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await _homeController.sendEmail();
                  },
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: TextWidget(
                      text: "ahmad.watan.2000@gmail.com",
                      fontSize: FontSize.s14,
                      color: isHoveredE.value
                          ? ColorManager.primary
                          : ColorManager.secondary,
                      fontFamily: "black",
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 80,
              width: 0.4,
              color: ColorManager.white,
            ),
          ],
        ),
      ),
    );
  }
}
