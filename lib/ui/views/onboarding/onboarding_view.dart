import 'package:flutter/material.dart';
import 'package:mum_health/gen/assets.gen.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'onboard_viewmodel.dart';
import 'widgets/onboard_item_view.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({super.key});

  @override
  Widget builder(
      BuildContext context, OnboardingViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      Center(
                        child: SizedBox(
                            height: 180,
                            width: 180,
                            child: Image.asset(_getMotherImageForIndex(
                                viewModel.currentPage))),
                      )
                    ],
                  )),
              const Expanded(
                flex: 2,
                  child: OnboardItemView()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: viewModel.currentPage != 0,
                    child: InkWell(
                      onTap: () {
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
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),

      // body: PageView(
      //   physics: const NeverScrollableScrollPhysics(), //This was done because the transition via sliding is not smooth yet.
      //   controller: viewModel.pageController,
      //   onPageChanged: (int page) {
      //     viewModel.currentPage = page;
      //   },
      //   children: const [
      //     OnboardView(),
      //     OnboardView(),
      //     OnboardView(),
      //     OnboardView(),
      //   ],
      // ),
    );
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
  OnboardingViewModel viewModelBuilder(BuildContext context) =>
      OnboardingViewModel();

  @override
  void onViewModelReady(OnboardingViewModel viewModel) => viewModel.onReady();

  @override
  void onDispose(OnboardingViewModel viewModel) => viewModel.onDispose();
}
