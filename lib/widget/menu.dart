import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/modules/home/home_controller.dart';
import 'package:portfolio/resources/values_manager.dart';
import 'package:portfolio/widget/item_menu.dart';
import 'package:responsive_framework/responsive_framework.dart' as res;

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);
  final _homeController = Get.put(HomeController());
  final Duration animationDuration = const Duration(milliseconds: 500);
  final RxBool isHoveredH = false.obs;
  final RxBool isHoveredA = false.obs;
  final RxBool isHoveredE = false.obs;
  final RxBool isHoveredP = false.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppPadding.p20,
        left: res.ResponsiveWrapper.of(context).isSmallerThan(res.TABLET)
            ? AppPadding.p37
            : MediaQuery.of(context).size.width * 0.18,
      ),
      child: Obx(
        () => AnimatedOpacity(
          opacity: _homeController.isExpanded.value ? 1.0 : 0.0,
          duration: animationDuration,
          child: AnimatedContainer(
            duration: animationDuration,
            width: double.infinity,
            height: _homeController.isExpanded.value ? 170.0 : 0.0,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p24),
                child: Column(
                  children: [
                    ItemMenu(
                      index: 0,
                      string: "Hello",
                      isHovered: isHoveredH,
                    ),
                    ItemMenu(
                      index: 1,
                      string: "About",
                      isHovered: isHoveredA,
                    ),
                    ItemMenu(
                      index: 2,
                      string: "Experience",
                      isHovered: isHoveredE,
                    ),
                    ItemMenu(
                      index: 3,
                      string: "Portfolio",
                      isHovered: isHoveredP,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
