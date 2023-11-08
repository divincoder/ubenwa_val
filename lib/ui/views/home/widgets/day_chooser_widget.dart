import 'package:flutter/material.dart';
import 'package:mum_health/ui/common/app_colors.dart';
import 'package:mum_health/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DayChooserWidget extends ViewModelWidget<HomeViewModel> {
  const DayChooserWidget({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SizedBox(
        height: 100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.months.length,
            padding: const EdgeInsets.all(0),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  viewModel.selectedDayIndex = index;
                },
                child: Stack(
                  children: [
                    Container(
                      width: 50,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(43.22),
                          color: viewModel.selectedDayIndex == index
                              ? AppColors.primary
                              : AppColors.dayBg),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(viewModel.days[index].day,
                              style: TextStyle(
                                  color: viewModel.selectedDayIndex == index
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.41),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300)),
                          Text(viewModel.days[index].date,
                              style: TextStyle(
                                  color: viewModel.selectedDayIndex == index
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.41),
                                  fontSize: 17,
                                  fontWeight:
                                      viewModel.selectedDayIndex == index
                                          ? FontWeight.w700
                                          : FontWeight.w400))
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      top: 0,
                      child: CircleAvatar(
                          radius: 6,
                          backgroundColor: viewModel.selectedDayIndex == index
                              ? AppColors.notificationIndicator
                              : Colors.transparent),
                    ),
                  ],
                ),
              );
            }));
  }
}
