import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/modules/home/home_controller.dart';
import 'package:portfolio/resources/color_manager.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:portfolio/resources/url_manager.dart';
import 'package:portfolio/widget/communication_icon.dart';
import 'package:responsive_framework/responsive_framework.dart' as res;

class RightBar extends StatelessWidget {
  RightBar({Key? key}) : super(key: key);
  final RxBool isHoveredG = false.obs;
  final RxBool isHoveredF = false.obs;
  final RxBool isHoveredT = false.obs;
  final RxBool isHoveredL = false.obs;
  final RxBool isHoveredC = false.obs;
  final RxBool isHoveredE = false.obs;

  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return res.ResponsiveVisibility(
      visible: true,
      hiddenWhen: const [res.Condition.smallerThan(name: res.TABLET)],
      child: SizedBox(
        height: 5000,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CommunicationIcon(
              iconData: EvaIcons.githubOutline,
              isHovered: isHoveredG,
              onTap: () {
                _homeController.launchInBrowser(urlGitHub);
              },
              normalColor: ColorManager.secondary,
              hoverColor: ColorManager.primary,
            ),
            const SizedBox(
              height: 24,
            ),
            CommunicationIcon(
              iconData: EvaIcons.facebookOutline,
              isHovered: isHoveredF,
              onTap: () {
                _homeController.launchInBrowser(urlFaceBock);
              },
              normalColor: ColorManager.secondary,
              hoverColor: ColorManager.primary,
            ),
            const SizedBox(
              height: 24,
            ),
            CommunicationIcon(
              iconData: EvaIcons.twitterOutline,
              isHovered: isHoveredT,
              onTap: () {
                _homeController.launchInBrowser(urlTwitter);
              },
              normalColor: ColorManager.secondary,
              hoverColor: ColorManager.primary,
            ),
            const SizedBox(
              height: 24,
            ),
            CommunicationIcon(
              iconData: EvaIcons.linkedinOutline,
              isHovered: isHoveredL,
              onTap: () {
                _homeController.launchInBrowser(urlLinkedIn);
              },
              normalColor: ColorManager.secondary,
              hoverColor: ColorManager.primary,
            ),
            const SizedBox(
              height: 24,
            ),
            CommunicationIcon(
              iconData: EvaIcons.codeDownloadOutline,
              isHovered: isHoveredC,
              onTap: () {},
              normalColor: ColorManager.secondary,
              hoverColor: ColorManager.primary,
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
