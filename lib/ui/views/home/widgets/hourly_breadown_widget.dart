import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/models/time_model.dart';
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
          width: double.maxFinite,
          height: 210,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              colors: AppColors.gradient,
              begin: const Alignment(0.96, -0.29),
              end: const Alignment(-0.96, 0.29),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                ...viewModel.timeModels.map((e) => _linearTimeProgress(e))
              ],
            ),
          ),
        ),
      ],
    );
  }

  _linearTimeProgress(TimeModel timeModel) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: FAProgressBar(
                  size: 10,
                  currentValue: timeModel.value,
                  maxValue: 1,
                  direction: Axis.vertical,
                  animatedDuration: const Duration(milliseconds: 600),
                  verticalDirection: VerticalDirection.up,
                  borderRadius: BorderRadius.circular(20.0),
                  backgroundColor: const Color(0xff052370).withOpacity(0.33),
                  progressColor: const Color(0xffE0E0E0),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("${timeModel.startTime}\n${timeModel.endTime}",
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 9,
                  color: Colors.white))
        ],
      ),
    );
  }
}
