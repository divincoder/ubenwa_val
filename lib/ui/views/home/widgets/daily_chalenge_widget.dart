import 'package:flutter/material.dart';
import 'package:mum_health/gen/assets.gen.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/ui/common/app_colors.dart';
import 'package:mum_health/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DailyChallengeWidget extends ViewModelWidget<HomeViewModel> {
  const DailyChallengeWidget({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
          color: AppColors.background.withOpacity(0.37),
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: AppColors.dailyChallengeBorder, width: 0.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              children: [
                CircleAvatar(
                    radius: 13,
                    backgroundColor: AppColors.dailyChallengeIconBg,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Assets.svg.star.svg(),
                    )),
                const SizedBox(width: 10),
                Text(S.current.dailyChallenge,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 11)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(height: 108, width: 108, child: Assets.png.pieChart.image())
        ],
      ),
    );
  }
}
