import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mum_health/gen/assets.gen.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/ui/common/app_colors.dart';
import 'package:mum_health/ui/views/onboarding/widgets/onboard_item_view.dart';
import 'package:mum_health/ui/views/onboarding/onboard_viewmodel.dart';

import 'package:stacked/stacked.dart';

class OnboardView extends ViewModelWidget<OnboardingViewModel> {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context, OnboardingViewModel viewModel) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final pageIndex = viewModel.currentPage;

    double angle = pi / 2; // Angle between baby positions
    double radius = 130.0; // Distance of babies from the mother picture

    // return Container(
    //   color: Colors.transparent, // Change color or add background image as needed
    //   child: Stack(
    //     children: [
    //       Positioned.fill(
    //           top: padding.top,
    //           left: 24,
    //           right: 24,
    //           child: Column(
    //             children: [
    //               Expanded(
    //                 child: Stack(
    //                   children: [
    //                     Center(
    //                       child: SizedBox(
    //                           height: 180,
    //                           width: 180,
    //                           child: Image.asset(_getMotherImageForIndex(
    //                               viewModel.currentPage))),
    //                     ),
    //                     for (int i = 0; i < 4; i++)
    //                       Positioned(
    //                         top: (pageIndex == 0 || pageIndex == 1)
    //                             ? 150
    //                             : null,
    //                         bottom: (pageIndex == 2 || pageIndex == 3)
    //                             ? 150
    //                             : null,
    //                         left: (pageIndex == 1 || pageIndex == 3)
    //                             ? 150
    //                             : null,
    //                         right: (pageIndex == 0 || pageIndex == 2)
    //                             ? 150
    //                             : null,
    //                         child: TweenAnimationBuilder<double>(
    //                           tween: Tween(begin: 0.0, end: angle * i),
    //                           duration: const Duration(milliseconds: 1000),
    //                           builder: (context, value, child) {
    //                             return Transform.translate(
    //                               offset: getBabyOffset(value, radius),
    //                               child: Padding(
    //                                 padding: const EdgeInsets.all(3.0),
    //                                 child: _getBabyImageForIndex(i),
    //                               ),
    //                             );
    //                           },
    //                         ),
    //                       ),
    //                   ],
    //                 ),
    //               ),
    //               Expanded(
    //                   child: OnboardItemView(viewModel.currentPage,
    //                       notifier: viewModel.pageScrollPositionNotifier,
    //                       onGetStarted: () {
    //                 viewModel.gotoHomeView();
    //               }))
    //             ],
    //           )),
    //       Positioned(
    //           bottom: padding.bottom + 20,
    //           left: 24,
    //           right: 24,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Visibility(
    //                 visible: viewModel.currentPage != 0,
    //                 child: InkWell(
    //                   onTap: () {
    //                     viewModel.pageController.previousPage(
    //                         duration: const Duration(milliseconds: 300),
    //                         curve: Curves.easeIn);
    //                   },
    //                   child: Text(
    //                     S.current.previous,
    //                     style: const TextStyle(
    //                         color: AppColors.defaultStateCTA,
    //                         fontSize: 16,
    //                         fontWeight: FontWeight.w600),
    //                   ),
    //                 ),
    //               ),
    //               Visibility(
    //                 visible: viewModel.currentPage != 3,
    //                 child: InkWell(
    //                   onTap: () {
    //                     viewModel.pageController.nextPage(
    //                         duration: const Duration(milliseconds: 300),
    //                         curve: Curves.easeIn);
    //
    //                     // if (viewModel.currentPage < 4) {
    //                     //   viewModel.pageController
    //                     //       .jumpToPage(viewModel.currentPage + 1);
    //                     // }
    //                   },
    //                   child: Text(
    //                     viewModel.currentPage == 0
    //                         ? S.current.showMeHow
    //                         : S.current.next,
    //                     style: const TextStyle(
    //                         color: AppColors.primary,
    //                         fontSize: 16,
    //                         fontWeight: FontWeight.w600),
    //                   ),
    //                 ),
    //               )
    //             ],
    //           ))
    //     ],
    //   ),
    // );

    return const SizedBox();
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
