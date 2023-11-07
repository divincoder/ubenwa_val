import 'package:flutter/material.dart';
import 'package:mum_health/gen/assets.gen.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/ui/common/app_colors.dart';
import 'package:mum_health/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class NextPredictedCryWidget extends ViewModelWidget<HomeViewModel> {
  const NextPredictedCryWidget({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.png.baby.image(height: 86),
          const SizedBox(height: 10),
          Text(S.current.nextPredictedCry,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.whiteHalf)),
          const SizedBox(height: 6),
          Text(viewModel.nextPredictedCry,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 21, color: AppColors.custard)),
          const SizedBox(height: 10),
          SizedBox(
            height: 24,
            width: 99,
            child: MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.86)),
              color: Colors.white.withOpacity(0.71),
              textColor: AppColors.alarmBtn,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Text(
                  S.current.setAlarm,
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 9),
                ),
              ),
            ),
          ),
          const SizedBox(height: 3),
        ],
      ),
    );
  }
}