import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/modules/home/home_controller.dart';
import 'package:portfolio/resources/color_manager.dart';
import 'package:portfolio/resources/font_manager.dart';
import 'package:portfolio/resources/url_manager.dart';
import 'package:portfolio/resources/values_manager.dart';
import 'package:portfolio/widget/communication_icon.dart';
import 'package:portfolio/widget/text_widget.dart';
import 'package:responsive_framework/responsive_framework.dart' as res;

class Contact extends StatelessWidget {
  Contact({Key? key}) : super(key: key);
  final RxBool isHovered = false.obs;
  final RxBool isHoveredG = false.obs;
  final RxBool isHoveredF = false.obs;
  final RxBool isHoveredT = false.obs;
  final RxBool isHoveredL = false.obs;
  final RxBool isHoveredC = false.obs;
  final RxBool isHoveredE = false.obs;
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        right: res.ResponsiveWrapper.of(context).isDesktop
            ? AppPadding.p280
            : AppPadding.p20,
        left: res.ResponsiveWrapper.of(context).isSmallerThan(res.TABLET)
            ? AppPadding.p20
            : MediaQuery.of(context).size.width * 0.19,
      ),
      child: SizedBox(
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: "04.",
                  fontSize: FontSize.s14,
                  color: ColorManager.primary,
                  fontWeight: FontWeightManager.light,
                  fontFamily: 'ibm',
                ),
                const SizedBox(
                  width: 8.0,
                ),
                TextWidget(
                  text: "What`s Next?",
                  fontSize: FontSize.s15,
                  color: ColorManager.primary,
                  fontWeight: FontWeightManager.bold,
                  fontFamily: 'jost',
                ),
              ],
            ),
            TextWidget(
              text: "Get In Touch",
              fontSize: FontSize.s45,
              color: ColorManager.ofWhite,
              fontFamily: "jost",
            ),
            TextWidget(
              textAlign: TextAlign.center,
              height: 1.6,
              text:
                  "Although I'm currently looking for SDE-1 opportunities, my inbox is\nalways open. Whether you have a question or just want to say hi, I'll try my\nbest to get back to you!",
              fontSize: FontSize.s16,
              color: ColorManager.secondary,
              fontFamily: "poppins",
            ),
            SizedBox(
              height: size.height * 0.04,
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
                    width: 127,
                    height: 49,
                    decoration: BoxDecoration(
                      color: isHovered.value
                          ? ColorManager.button
                          : ColorManager.background,
                      borderRadius: BorderRadius.circular(
                        3.0,
                      ),
                      border: Border.all(
                        color: ColorManager.button,
                        width: 1.8,
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        _homeController.sendEmail();
                      },
                      child: TextWidget(
                        color: isHovered.value
                            ? Colors.white
                            : ColorManager.primary,
                        fontFamily: "jost",
                        text: "Say Hello",
                        fontSize: FontSize.s13,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            res.ResponsiveVisibility(
              visible: false,
              visibleWhen: const [res.Condition.smallerThan(name: res.TABLET)],
              child: Column(
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Obx(
                    () => MouseRegion(
                      onEnter: (event) {
                        isHoveredE.value = true;
                      },
                      onExit: (event) {
                        isHoveredE.value = false;
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 1),
                        transform: Matrix4.translationValues(
                          0,
                          isHoveredE.value ? -1.7 : 0,
                          0,
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {},
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
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      CommunicationIcon(
                        iconData: EvaIcons.facebookOutline,
                        isHovered: isHoveredF,
                        onTap: () {
                          _homeController.launchInBrowser(urlFaceBock);
                        },
                        normalColor: ColorManager.secondary,
                        hoverColor: ColorManager.primary,
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
                      CommunicationIcon(
                        iconData: EvaIcons.linkedinOutline,
                        isHovered: isHoveredL,
                        onTap: () {
                          _homeController.launchInBrowser(urlLinkedIn);
                        },
                        normalColor: ColorManager.secondary,
                        hoverColor: ColorManager.primary,
                      ),
                      CommunicationIcon(
                        iconData: EvaIcons.codeDownloadOutline,
                        isHovered: isHoveredC,
                        onTap: () {},
                        normalColor: ColorManager.secondary,
                        hoverColor: ColorManager.primary,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    )
        .animate(delay: 200.ms)
        .slideX(duration: 600.ms, begin: -0.1)
        .fadeIn(duration: 1000.ms);
  }
}
