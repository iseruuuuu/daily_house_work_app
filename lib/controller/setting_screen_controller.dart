import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreenController extends GetxController {
  RxString version = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadVersion();
  }

  Future<void> loadVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    version.value = packageInfo.version;
  }

  Future<void> onTapReview() async {
    await EasyLoading.show(status: 'loading....');
    await Future.delayed(const Duration(seconds: 2));
    final inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      await EasyLoading.dismiss();
      await inAppReview.requestReview();
    }
  }

  Future<void> onTapMail() async {
    final url = Uri.parse('https://forms.gle/57XGrc1ThShbAuMn6');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> onTapTwitter() async {
    final url = Uri.parse('twitter://user?screen_name=isekiryu');
    final secondUrl = Uri.parse('https://twitter.com/isekiryu');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else if (await canLaunchUrl(secondUrl)) {
      await launchUrl(secondUrl);
    } else {
      openErrorDialog();
    }
  }

  void openErrorDialog() {
    PanaraInfoDialog.show(
      Get.context!,
      title: 'Error',
      message: "You can't open twitter link.\n"
          'Try again.',
      buttonText: 'OK',
      panaraDialogType: PanaraDialogType.error,
      barrierDismissible: false,
      onTapDismiss: Get.back,
    );
  }

  void onTapLicense() {
    Get.to(const LicensePage());
  }

  Future<void> onTapGithub() async {
    final Uri url = Uri.parse('https://github.com/iseruuuuu');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
