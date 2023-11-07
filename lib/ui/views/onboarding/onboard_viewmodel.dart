import 'package:flutter/material.dart';
import 'package:mum_health/app/app.router.dart';
import 'package:mum_health/ui/views/home/widgets/loading_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends BaseViewModel {
  final _navigationService = NavigationService();

  final PageController _pageController = PageController(initialPage: 0);

  PageController get pageController => _pageController;

  double _viewOffset = 0.0;

  double get viewOffset => _viewOffset;

  set viewOffset(double value) {
    _viewOffset = value;
    notifyListeners();
  }

  int _currentPage = 0;

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  onReady() {}

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
