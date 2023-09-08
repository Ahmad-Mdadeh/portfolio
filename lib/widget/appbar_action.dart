import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/modules/home/home_controller.dart';
import 'package:portfolio/resources/assets_manager.dart';
import 'package:portfolio/resources/values_manager.dart';
import 'package:responsive_framework/responsive_framework.dart' as res;

class AppBarAction extends StatelessWidget {
  AppBarAction({Key? key}) : super(key: key);
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return res.ResponsiveVisibility(
      visible: false,
      visibleWhen: const [res.Condition.smallerThan(name: res.TABLET)],
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p14,
          horizontal: AppPadding.p24,
        ),
        child: InkWell(
          onTap: () {
            _homeController.isExpanded(!(_homeController.isExpanded.value));
          },
          child: const Image(
            image: AssetImage(
              ImagesAssets.menu,
            ),
          ),
        ),
      ),
    );
  }
}
