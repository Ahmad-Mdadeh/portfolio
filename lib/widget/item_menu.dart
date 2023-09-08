import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/modules/home/home_controller.dart';
import 'package:portfolio/resources/color_manager.dart';
import 'package:portfolio/resources/font_manager.dart';
import 'package:portfolio/widget/text_widget.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ItemMenu extends StatelessWidget {
  ItemMenu({
    Key? key,
    required this.index,
    required this.string,
    required this.isHovered,
  }) : super(key: key);

  final int index;
  final String string;
  final RxBool isHovered;
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () async {
          await _homeController.autoScrollController.scrollToIndex(
            index,
            preferPosition: AutoScrollPosition.begin,
            duration: const Duration(
              milliseconds: 500,
            ),
          );
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: MouseRegion(
            onEnter: (event) {
              isHovered.value = true;
            },
            onExit: (event) {
              isHovered.value = false;
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 1),
              transform: Matrix4.translationValues(
                isHovered.value ? -0.8 : 0,
                isHovered.value ? -2.3 : 0,
                0,
              ),
              child: TextWidget(
                color: isHovered.value
                    ? ColorManager.primary
                    : ColorManager.white.withOpacity(0.7),
                text: string,
                fontSize: FontSize.s18,
                fontFamily: "jost",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
