import 'package:flutter/material.dart';
import 'package:mum_health/gen/assets.gen.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:stacked/stacked.dart';
import 'package:mum_health/ui/common/app_colors.dart';
import 'package:mum_health/ui/common/ui_helpers.dart';
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
              const SizedBox(height: 20),
              const TodayOverviewContainer(),
              const SizedBox(height: 25),
              const HourlyBreakdownWidget(),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DailyChallengeWidget(),
                  NextPredictedCryWidget()
                ],
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
          GestureDetector(
              onTap: () {}, child: Assets.svg.arrowLeft.svg()),
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

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
