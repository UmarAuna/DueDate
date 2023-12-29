import 'dart:async';

import 'package:due_date_new/screens/home/home_page.dart';
import 'package:due_date_new/utils/app_colors.dart';
import 'package:due_date_new/utils/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreenPage extends StatefulWidget {
  static const id = 'splash_screen_page';

  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> with SingleTickerProviderStateMixin {
  /// ANIMATION CONTROLLER
  late AnimationController _controller;

  /// ANIMATION
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    /// INITIALING THE CONTROLLER
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    /// INITIALING THE ANIMATION
    _animation = CurvedAnimation(parent: _controller, curve: Curves.fastEaseInToSlowEaseOut);

    /// STARTING THE ANIMATION
    _controller.forward();

    /// TIMER FOR SPLASH DURATION
    Timer(const Duration(seconds: 3), () {
      /// NAVIAGTING TO LOGIN SCREEN
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: ScaleTransition(
          scale: _animation,
          child: Center(
            child: SvgPicture.asset(
              AppVectors.appLogo,
            ),
          ),
        ),
      ),
    );
  }
}
