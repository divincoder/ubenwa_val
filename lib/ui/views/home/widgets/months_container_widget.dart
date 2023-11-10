import 'package:flutter/material.dart';
import 'package:mum_health/ui/common/app_colors.dart';
import 'package:mum_health/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MonthsContainerWidget extends ViewModelWidget<HomeViewModel> {
  const MonthsContainerWidget({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SizedBox(
        height: 40,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.months.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    viewModel.selectedMonthIndex = index;
                  },
                  child: Text(viewModel.months[index],
                      style: TextStyle(
                          color: viewModel.selectedMonthIndex == index
                              ? AppColors.primary
                              : AppColors.textSecondary,
                          fontSize: 17,
                          fontWeight: viewModel.selectedMonthIndex == index ? FontWeight.w600 : FontWeight.w300)),
                ),
              );
            }));
  }
}