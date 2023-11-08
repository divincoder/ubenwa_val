import 'package:flutter/material.dart';
import 'package:mum_health/gen/assets.gen.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:stacked/stacked.dart';
import 'package:mum_health/ui/common/app_colors.dart';
import 'home_viewmodel.dart';
import 'widgets/widgets.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _appBar(),
              const SizedBox(height: 10),
              _monthsContainer(viewModel),
              const SizedBox(height: 10),
              _dayChooserContainer(viewModel),
              const SizedBox(height: 30),
              const TodayOverviewContainer(),
              const SizedBox(height: 25),
              const HourlyBreakdownWidget(),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [DailyChallengeWidget(), NextPredictedCryWidget()],
              )
            ],
          ),
        ),
      ),
    );
  }

  //All this can be custom widgets that can be customized and reused. Same applies to other widgets in the app that has universal usage
  _appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          GestureDetector(onTap: () {}, child: Assets.svg.arrowLeft.svg()),
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Text(S.current.cryRecords,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          )),
          IconButton(
              onPressed: () {}, icon: Assets.svg.notificationOutline.svg()),
        ],
      ),
    );
  }

  _monthsContainer(HomeViewModel viewModel) {
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
  
  _dayChooserContainer(HomeViewModel viewModel) {
    return SizedBox(
        height: 100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.months.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  viewModel.selectedDayIndex = index;
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  padding: const EdgeInsets.all(8.0),
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(43.22),
                    color: viewModel.selectedDayIndex == index ? AppColors.primary : AppColors.dayBg
                  ),
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
                              fontWeight: viewModel.selectedDayIndex == index ? FontWeight.w700 : FontWeight.w400))
                    ],
                  ),
                ),
              );
            }));
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.onReady();
}
