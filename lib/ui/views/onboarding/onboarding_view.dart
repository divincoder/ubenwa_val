import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'onboard_view.dart';
import 'onboard_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({super.key});

  @override
  Widget builder(BuildContext context, OnboardingViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(), //This was done because the transition via sliding is not smooth yet.
        controller: viewModel.pageController,
        onPageChanged: (int page) {
          viewModel.currentPage = page;
        },
        children: const [
          OnboardView(),
          OnboardView(),
          OnboardView(),
          OnboardView(),
        ],
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(BuildContext context) => OnboardingViewModel();

  @override
  void onViewModelReady(OnboardingViewModel viewModel) => viewModel.onReady();

  @override
  void onDispose(OnboardingViewModel viewModel) => viewModel.onDispose();
}