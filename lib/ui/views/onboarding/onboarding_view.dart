import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mum_health/gen/assets.gen.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'onboard_viewmodel.dart';
import 'widgets/onboard_item_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  // Number of pictures
  final int numPictures = 4;

  // Default radius
  final double defaultRadius = 140.0;

  // Current rotation angle
  double currentAngle = 0.0;

  //track baby image to change bg
  int currentPos = 1;

  List<String> babyImages = [
    Assets.png.babyOne.path,
    Assets.png.babyTwo.path,
    Assets.png.babyThree.path,
    Assets.png.babyFour.path,
  ];

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Initialize animation
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.addListener(() {
      setState(() {
        // Update the current rotation angle during the animation
        currentAngle = defaultRadius * _animation.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      viewModelBuilder: () => OnboardingViewModel(),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      onDispose: (viewModel) => viewModel.dispose(),
      builder: (context, viewModel, child) {
        final size = MediaQuery.of(context).size;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Stack(alignment: Alignment.center, children: [
                      Center(
                        child: SizedBox(
                            height: 180,
                            width: 180,
                            child: Image.asset(_getMotherImageForIndex(
                                viewModel.currentPage))),
                      ),
                      ...List.generate(numPictures, (index) {
                        // Calculate position of each picture based on the current angle and size of screen
                        double pictureAngle =
                            (index * (2 * pi) / numPictures) + currentAngle;
                        double pictureX = size.width / 2.4 +
                            defaultRadius * cos(pictureAngle);
                        double pictureY = size.height / 4.4 +
                            defaultRadius * sin(pictureAngle);

                        return Positioned(
                          left: pictureX,
                          top: pictureY,
                          child: _getBabyImageForIndex(index),
                        );
                      }),
                    ])),
                const Expanded(flex: 2, child: OnboardItemView()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: viewModel.currentPage != 0,
                        child: InkWell(
                          onTap: () {
                            _rotatePictures(true); // Rotate clockwise
                            viewModel.prevModel();
                          },
                          child: Text(
                            S.current.previous,
                            style: const TextStyle(
                                color: AppColors.defaultStateCTA,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: viewModel.currentPage != 3,
                        child: InkWell(
                          onTap: () {
                            _rotatePictures(false);  // Rotate counterclockwise
                            viewModel.nextModel();
                          },
                          child: Text(
                            viewModel.currentPage == 0
                                ? S.current.showMeHow
                                : S.current.next,
                            style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  void _rotatePictures(bool clockwise) {
    // Calculate the target angle based on the rotation direction
    double targetAngle =
        clockwise ? currentAngle - (pi / 2) : currentAngle + (pi / 2);

    // Set up the animation
    _animation = Tween<double>(
      begin: currentAngle / defaultRadius,
      end: targetAngle / defaultRadius,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.forward(from: 0.0);

    //update the BG color of the focus baby
    updateCurrentPos(clockwise);
  }

  updateCurrentPos(bool clockwise) {
    setState(() {
      if (clockwise) {
        currentPos = currentPos + 1;
      } else {
        currentPos = currentPos - 1;
      }

      if (currentPos < 0) currentPos = 3;
      if (currentPos > 3) currentPos = 0;
    });
  }

  Widget _getBabyImageForIndex(int index) {
    debugPrint("index: $index");
    List<String> babyImages = [
      Assets.png.babyTwo.path,
      Assets.png.babyThree.path,
      Assets.png.babyFour.path,
      Assets.png.babyOne.path,
    ];

    return Container(
      alignment: Alignment.center,
      decoration:
          BoxDecoration(color: _getBabyBG(index), shape: BoxShape.circle),
      padding: const EdgeInsets.all(10.0),
      child: Image.asset(
        babyImages[index],
        width: 45,
        height: 45,
      ),
    );
  }

  Color _getBabyBG(int index) {
    List<Color> babyImageBG = [
      AppColors.babyTwoBg,
      AppColors.babyThreeBg,
      AppColors.babyFourBg,
      AppColors.babyOneBg,
    ];

    if (index == currentPos) {
      return currentPos % 2 == 0
          ? AppColors.accentMainTwo
          : AppColors.accentMainOne;
    } else {
      return babyImageBG[index];
    }
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
