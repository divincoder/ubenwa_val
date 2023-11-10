import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mum_health/gen/assets.gen.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/ui/common/app_colors.dart';
import 'package:mum_health/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TodayOverviewContainer extends ViewModelWidget<HomeViewModel> {
  const TodayOverviewContainer({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.current.todaysOverview,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: AppColors.text)),
          const SizedBox(height: 20),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _overviewItem(
                    title: S.current.numberOfCryEpisode,
                    path: Assets.svg.sunFog.path,
                    value: "45",
                    description: S.current.betterThanYesterday("25%"),
                bgColor: AppColors.lightBlue),
                _overviewItem(
                    title: S.current.longestCryDuration,
                    path: Assets.svg.wifiSquare.path,
                    value: "30 mins",
                    description: S.current.worstThanYesterday("20%"),
                    bgColor: AppColors.lightYellow),
                _overviewItem(
                    title: S.current.cumulativeCryDuration,
                    path: Assets.svg.chart.path,
                    value: "4hours",
                    description: S.current.betterThanYesterday("20%"),
                    bgColor: AppColors.lighterBlue)
              ],
            ),
          )
        ],
      ),
    );
  }

  _overviewItem(
      {required String title,
      required String path,
      required String value,
      required String description,
      required Color bgColor}) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: AppColors.background.withOpacity(0.37),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.darkBlue, width: 0.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              children: [
                CircleAvatar(radius: 13,
                    backgroundColor: bgColor,
                    child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SvgPicture.asset(path),
                )),
                const SizedBox(width: 10),
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 11)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: Text(value,
                  style:
                      const TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
            ),
          ),
          const SizedBox(height: 20),
          Flexible(
            child: Text(description,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: AppColors.red)),
          ),
        ],
      ),
    );
  }
}
