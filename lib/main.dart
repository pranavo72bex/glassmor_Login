import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glassmor_login/theme/themedata.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      theme: Apptheme().defaultheme,
      getPages: AppPages.routes,
    ),
  );
}
