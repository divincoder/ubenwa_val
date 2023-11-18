import 'package:flutter/material.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/models/onboarding_model.dart';
import 'package:mum_health/ui/common/app_colors.dart';
import 'package:mum_health/ui/views/onboarding/onboard_viewmodel.dart';
import 'package:mum_health/ui/widgets/effects.dart';
import 'package:stacked/stacked.dart';

class OnboardItemView extends ViewModelWidget<OnboardingViewModel> {
  const OnboardItemView({super.key});

  @override
  Widget build(BuildContext context, OnboardingViewModel viewModel) {
    var onboardingModel = viewModel.onboardingModels[viewModel.currentPage];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _buildCarousel(onboardingModel),
          const SizedBox(height: 24),
          ScaleEffect(
            page: viewModel.currentPage,
            notifier: viewModel.pageScrollPositionNotifier,
            child: Text(
              onboardingModel.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.text, fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 24),
          ScaleEffect(
            page: viewModel.currentPage,
            notifier: viewModel.pageScrollPositionNotifier,
            child: Text(
              onboardingModel.desc,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  height: 1.5,
                  fontWeight: FontWeight.w300),
            ),
          ),
          const SizedBox(height: 24),

          if(viewModel.currentPage == viewModel.onboardingModels.length - 1)
            MaterialButton(
            onPressed: viewModel.gotoHomeView,
            minWidth: double.maxFinite,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: AppColors.primary,
            textColor: Colors.white,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Text(
                S.current.getStarted,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildCarousel(OnboardingModel onboardingModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 4; i++)
          Container(
            width: onboardingModel.index == i ? 15 : 6.0,
            height: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
            decoration: BoxDecoration(
              borderRadius: i == onboardingModel.index ? BorderRadius.circular(7) : null,
              shape: i == onboardingModel.index ? BoxShape.rectangle : BoxShape.circle,
              color: i == onboardingModel.index
                  ? i % 2 == 0
                      ? AppColors.accentMainOne
                      : AppColors.primary
                  : AppColors.defaultCarousel,
            ),
          )
      ],
    );
  }
}
