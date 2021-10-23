import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/custom_theme.dart';
import 'package:recipe_app/views/bookmark_view.dart';

import 'views/home_view.dart';

void main() {
  runApp(
    // DevicePreview(
    //   builder: (context) => const MyApp(),
    // ),

    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Recipe',
      theme: customLightTheme(context),
      darkTheme: customDarkTheme(context),
      themeMode: ThemeMode.system,
      home:  HomeView(),
    );
  }
}
