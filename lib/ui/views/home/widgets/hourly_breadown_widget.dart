import 'package:flutter/material.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/ui/common/app_colors.dart';
import 'package:mum_health/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HourlyBreakdownWidget extends ViewModelWidget<HomeViewModel> {
  const HourlyBreakdownWidget({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(S.current.hourlyBreakdown,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: AppColors.text)),
        ),
        const SizedBox(height: 20),
        Container(
          color: AppColors.primary,
          width: double.maxFinite,
          height: 200,
        ),
      ],
    );
  }
}
