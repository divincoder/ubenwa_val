import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mum_health/app/app.router.dart';
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
    notifyListeners();
  }

  onReady() {
    _pageController.addListener(() {
      pageScrollPositionNotifier.value = _pageController.page;
    });
  }

  onDispose() {
    _pageController.dispose();
  }

  void gotoHomeView() {
    _navigationService.clearStackAndShowView(LoadingView(
      onLoadFinished: () {
        _navigationService.replaceWithHomeView();
      },
    ));
  }
}
