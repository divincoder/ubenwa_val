import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'onboard_view.dart';
import 'onboard_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({super.key});

  @override
  Widget builder(BuildContext context, OnboardingViewModel viewModel, Widget? child) {
    return Scaffold(
      body: PageView(
        controller: viewModel.pageController,
        onPageChanged: (int page) {
          viewModel.currentPage = page;
          viewModel.viewOffset = viewModel.pageController.offset;
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