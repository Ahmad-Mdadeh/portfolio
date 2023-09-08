import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  AutoScrollController autoScrollController = AutoScrollController();

  RxBool isExpanded = false.obs;
  late BuildContext context;

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'ahmad.abowatan.2000@gmail.com',
      queryParameters: {
        'subject': 'Your subject here',
        'body': 'Your email content here',
      },
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch email';
    }
  }
}
