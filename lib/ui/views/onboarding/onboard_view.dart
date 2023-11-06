import 'package:flutter/material.dart';
import 'package:mum_health/gen/assets.gen.dart';
import 'package:mum_health/ui/views/onboarding/onboard_viewmodel.dart';
import 'package:stacked/stacked.dart';

class OnboardView extends ViewModelWidget<OnboardingViewModel> {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context, OnboardingViewModel viewModel) {
    return Container(
      color: Colors.white, // Change color or add background image as needed
      child: Stack(
        children: [
          Center(
            child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(
                    _getMotherImageForIndex(viewModel.currentPage))),
          ),
          for (int i = 0; i < 4; i++)
            Positioned(
              top: (i == 0 || i == 1) ? 90 : null,
              bottom: (i == 2 || i == 3) ? 90 : null,
              left: (i == 1 || i == 3) ? 90 : null,
              right: (i == 0 || i == 2) ? 90 : null,
              child: AnimatedAlign(
              duration: const Duration(milliseconds: 500),
                alignment: getBabyAlignment(i, viewModel.currentPage),
                child: Image.asset(
                  _getBabyImageForIndex(i),
                ),
              ),
            ),

        ],
      ),
    );
  }

  Alignment getBabyAlignment(int index, int currentPage) {
    double angle = (2 * currentPage * 3.1416 / 4); // Converted to radians
    double babyDistance = 90.0; // Distance of babies from the mother picture

    // Adjust positions of babies based on the angle and distance
    double x = 90 * (index % 2 == 0 ? 1 : -1) * (index < 2 ? 1 : -1);
    double y = 90 * (index < 2 ? 1 : -1);

    double cos = x * angle.abs() - y * angle.abs();
    double sin = x * angle.abs() + y * angle.abs();

    return Alignment(cos, sin);
  }

  String _getBabyImageForIndex(int index) {
    List<String> babyImages = [
      Assets.png.babyOne.path,
      Assets.png.babyTwo.path,
      Assets.png.babyThree.path,
      Assets.png.babyFour.path,
    ];

    return babyImages[index];
  }

  String _getMotherImageForIndex(int index) {
    List<String> babyImages = [
      Assets.png.mumOne.path,
      Assets.png.mumTwo.path,
      Assets.png.mumThree.path,
      Assets.png.mumFour.path,
    ];

    return babyImages[index];
  }
}
