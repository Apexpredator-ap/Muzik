import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muzik/view/login_screen.dart';
import 'package:muzik/widgets/bottom_nav.dart';

import '../const/colors.dart';
import '../widgets/custom_progress_bar.dart';
import 'home_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late double percentage = 0.0;
  AnimationController? _controller;
  double _animationValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));

    _controller?.addListener(() {
      setState(() {
        _animationValue = _controller!.value;
      });
    });

    _controller?.forward().then((_) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Image.asset(
              "assets/images/logo.png",
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                CustomPaint(
                  painter: LiquidPainter(_animationValue, 1.0),
                  size: Size(200.0, 200.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
