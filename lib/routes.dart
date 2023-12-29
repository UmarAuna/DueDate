import 'package:due_date_new/screens/home/home_page.dart';
import 'package:due_date_new/screens/splash_screen/splash_screen_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreenPage.id: (context) => const SplashScreenPage(),
  HomePage.id: (context) => const HomePage(),
};
