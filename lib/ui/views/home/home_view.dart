import 'package:flutter/material.dart';
import 'package:mum_health/gen/assets.gen.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/ui/common/ui_helpers.dart';
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
              _appBar(viewModel),
              verticalSpaceSmall,
              const MonthsContainerWidget(),
              verticalSpaceSmall,
              const DayChooserWidget(),
              verticalSpaceMedium,
              const TodayOverviewContainer(),
              verticalSpaceMedium,
              const HourlyBreakdownWidget(),
              verticalSpaceMedium,
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
  _appBar(HomeViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                viewModel.logOut();
              },
              child: Assets.svg.arrowLeft.svg()),
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Text(S.current.cryRecords,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          )),
          SizedBox(
            width: 50,
            child: Stack(
              children: [
                Center(
                  child: IconButton(
                      onPressed: () {},
                      icon: Assets.svg.notificationOutline.svg()),
                ),
                const Positioned(
                  right: 16,
                  top: 13,
                  child: CircleAvatar(
                      radius: 4, backgroundColor: AppColors.notificationIndicator),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.onReady();
}
