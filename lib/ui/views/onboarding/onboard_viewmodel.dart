import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mum_health/app/app.router.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/models/onboarding_model.dart';
import 'package:mum_health/ui/views/home/widgets/loading_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends BaseViewModel {
  final _navigationService = NavigationService();
  final ValueNotifier<double?> pageScrollPositionNotifier = ValueNotifier(0);

  final PageController _pageController = PageController(initialPage: 0);

  PageController get pageController => _pageController;

  int _currentPage = 0;

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    pageScrollPositionNotifier.value = _currentPage.toDouble();
    notifyListeners();
  }

  onReady() {
    _pageController.addListener(() {
      pageScrollPositionNotifier.value = _pageController.page;
    });
  }

  onDispose() {
    _pageController.dispose();
    pageScrollPositionNotifier.dispose();
  }

  void gotoHomeView() {
    _navigationService.clearStackAndShowView(LoadingView(
      onLoadFinished: () {
        _navigationService.replaceWithHomeView();
      },
    ));
  }

  final onboardingModels = [
    OnboardingModel(
        title: S.current.onboardHeadingOne,
        desc: S.current.onboardDescOne,
        index: 0),
    OnboardingModel(
        title: S.current.onboardHeadingTwo,
        desc: S.current.onboardDescTwo,
        index: 1),
    OnboardingModel(
        title: S.current.onboardHeadingThree,
        desc: S.current.onboardDescThree,
        index: 2),
    OnboardingModel(
        title: S.current.onboardHeadingFour,
        desc: S.current.onboardDescFour,
        index: 3),
  ];

  void nextModel() {
    if(currentPage < 4) {
      currentPage = _currentPage + 1;
    }
  }

  prevModel() {
    if(currentPage > 0) {
      currentPage = currentPage - 1;
    }
  }
}
