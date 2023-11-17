import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mum_health/gen/assets.gen.dart';
import 'package:mum_health/ui/common/app_colors.dart';

class BabyCircularWidget extends StatefulWidget {
  final int pageIndex;
  const BabyCircularWidget({required this.pageIndex, super.key});

  @override
  State<BabyCircularWidget> createState() => _BabyCircularWidgetState();
}

class _BabyCircularWidgetState extends State<BabyCircularWidget> {
  double angle = pi / 2; // Angle between baby positions
  double radius = 130.0;

  @override
  Widget build(BuildContext context) {
    int pageIndex = widget.pageIndex;

    return Stack(
      children: [
        for (int i = 0; i < 4; i++)
          Positioned(
            top: (pageIndex == 0 || pageIndex == 1)
                ? 150
                : null,
            bottom: (pageIndex == 2 || pageIndex == 3)
                ? 150
                : null,
            left: (pageIndex == 1 || pageIndex == 3)
                ? 150
                : null,
            right: (pageIndex == 0 || pageIndex == 2)
                ? 150
                : null,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: angle * i),
              duration: const Duration(milliseconds: 1000),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: getBabyOffset(value, radius),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: _getBabyImageForIndex(i),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Offset getBabyOffset(double angle, double radius) {
    double x = radius * cos(angle);
    double y = radius * sin(angle);

    return Offset(x, y);
  }

  Widget _getBabyImageForIndex(int index) {
    List<String> babyImages = [
      Assets.png.babyOne.path,
      Assets.png.babyTwo.path,
      Assets.png.babyThree.path,
      Assets.png.babyFour.path,
    ];

    return Container(
      decoration:
      BoxDecoration(color: _getBabyBG(index), shape: BoxShape.circle),
      padding: const EdgeInsets.all(5.0),
      child: Image.asset(babyImages[index], width: 40, height: 40,),
    );
  }

  Color _getBabyBG(int index) {
    List<Color> babyImageBG = [
      AppColors.babyOneBg,
      AppColors.babyTwoBg,
      AppColors.babyThreeBg,
      AppColors.babyFourBg,
    ];

    return babyImageBG[index];
  }
}