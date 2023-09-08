import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/modules/home/home_controller.dart';
import 'package:portfolio/resources/color_manager.dart';
import 'package:portfolio/resources/font_manager.dart';
import 'package:portfolio/widget/text_widget.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ContactButton extends StatelessWidget {
  final _homeController = Get.put(HomeController());
  final int index;
  final RxBool isHovered;

  ContactButton({
    Key? key,
    required this.index,
    required this.isHovered,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
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
            isHovered.value ? -8 : 0,
            0,
          ),
          child: Container(
            width: 88,
            height: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                3.0,
              ),
              border: Border.all(
                color: ColorManager.primary,
                width: 1.5,
              ),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: ColorManager.background,
              ),
              onPressed: () async {
                await _homeController.autoScrollController.scrollToIndex(
                  index,
                  preferPosition: AutoScrollPosition.begin,
                );
                _homeController.autoScrollController.highlight(index);
              },
              child: TextWidget(
                color: ColorManager.primary,
                fontFamily: "jost",
                text: "Contact",
                fontSize: FontSize.s12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
