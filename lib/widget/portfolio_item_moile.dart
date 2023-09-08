import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/resources/color_manager.dart';
import 'package:portfolio/resources/font_manager.dart';
import 'package:portfolio/resources/values_manager.dart';
import 'package:portfolio/widget/text_widget.dart';

class PortfolioItemMobile extends StatelessWidget {
  final RxBool isHovered;
  final bool side;
  final String image;

  const PortfolioItemMobile({
    super.key,
    required this.isHovered,
    required this.side,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            transform: Matrix4.translationValues(
              0,
              isHovered.value ? -8 : 0,
              0,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                0,
                AppPadding.p37,
                0,
                0,
              ),
              child: MouseRegion(
                onEnter: (event) {
                  isHovered.value = true;
                },
                onExit: (event) {
                  isHovered.value = false;
                },
                child: Container(
                  width: 370,
                  height: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          )
              .animate(delay: 200.ms)
              .slideX(duration: 600.ms, begin: !side ? -0.25 : 0.25)
              .fadeIn(duration: 1000.ms),
          const SizedBox(
            height: 23,
          ),
          Column(
            crossAxisAlignment:
                side ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: "Featured project",
                fontSize: FontSize.s15,
                fontFamily: "jost",
                color: ColorManager.primary,
              ),
              const SizedBox(
                height: 2,
              ),
              TextWidget(
                text: "Flutter ECommerce",
                fontSize: FontSize.s26,
                fontFamily: "jost",
                color: ColorManager.ofWhite,
              ),
              const SizedBox(
                height: 22,
              ),
              Container(
                width: 370,
                height: 130,
                decoration: BoxDecoration(
                  color: ColorManager.backgroundContainer,
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p10,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: Center(
                      child: TextWidget(
                        height: 1.6,
                        text:
                            "A blog application using Flutter and firebase, In this project implement Firebase CURD operation, User can add post as well see all the post, In this project implement Firebase CURD operation, In this project implement operation.",
                        fontSize: FontSize.s15,
                        fontFamily: "poppins",
                        color: ColorManager.secondary,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              TextWidget(
                text: "Dart \t Android \t IOS",
                fontSize: FontSize.s14,
                fontFamily: "poppins",
                color: ColorManager.secondary,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  // Handle the tap event if needed
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Icon(
                  EvaIcons.link,
                  color: ColorManager.ofWhite,
                  size: 22,
                ),
              ),
            ],
          )
              .animate(delay: 200.ms)
              .slideX(duration: 600.ms, begin: !side ? 0.25 : -0.25)
              .fadeIn(duration: 1000.ms),
        ],
      ),
    );
  }
}
