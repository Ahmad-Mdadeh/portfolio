import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/modules/home/home_controller.dart';
import 'package:portfolio/modules/pages/about.dart';
import 'package:portfolio/modules/pages/contact.dart';
import 'package:portfolio/modules/pages/experience.dart';
import 'package:portfolio/modules/pages/intro.dart';
import 'package:portfolio/modules/pages/portfolio.dart';
import 'package:portfolio/resources/color_manager.dart';
import 'package:portfolio/widget/appbar_action.dart';
import 'package:portfolio/widget/appbar_title.dart';
import 'package:portfolio/widget/left_bar.dart';
import 'package:portfolio/widget/menu.dart';
import 'package:portfolio/widget/right_bar.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final RxBool isHovered = false.obs;
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    homeController.context = context;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: CustomScrollView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                controller: homeController.autoScrollController,
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    backgroundColor: ColorManager.background,
                    titleSpacing: -30,
                    toolbarHeight: 80,
                    title: AppBarTitle(),
                    actions: [AppBarAction()],
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Menu(),
                        wrapScrollTag(index: 0, child: Intro()),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        wrapScrollTag(index: 1, child: About()),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        wrapScrollTag(index: 2, child: const Experience()),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        wrapScrollTag(index: 3, child: Portfolio()),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        wrapScrollTag(index: 4, child: Contact()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 45,
            child: RightBar(),
          ),
          Positioned(
            bottom: 0,
            right: 45,
            child: LeftBar(),
          ),
        ],
      ),
    );
  }

  Widget wrapScrollTag({required int index, required Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: homeController.autoScrollController,
      index: index,
      child: child,
    );
  }
}
