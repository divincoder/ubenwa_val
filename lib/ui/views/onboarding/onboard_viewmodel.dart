import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnboardingViewModel extends BaseViewModel {
  final PageController _pageController = PageController(initialPage: 0);
  PageController get pageController => _pageController;

  int _currentPage = 0;
  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  onReady() {

  }

  onDispose() {
    _pageController.dispose();
  }
}