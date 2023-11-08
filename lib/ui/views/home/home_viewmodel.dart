import 'package:mum_health/app/app.bottomsheets.dart';
import 'package:mum_health/app/app.dialogs.dart';
import 'package:mum_health/app/app.locator.dart';
import 'package:mum_health/app/app.router.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/models/day_model.dart';
import 'package:mum_health/models/time_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  var nextPredictedCry = "12:40 - 14:30";
  final months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "June",
    "Jul",
    "Aug",
    "Sept",
    "Oct",
    "Nov",
    "Dec"
  ];
  final days = [
    DayModel(day: "Wed", date: "19"),
    DayModel(day: "Thu", date: "13"),
    DayModel(day: "Fri", date: "14"),
    DayModel(day: "Sat", date: "15"),
    DayModel(day: "Sun", date: "16"),
    DayModel(day: "Mon", date: "17"),
    DayModel(day: "Tue", date: "18"),
    DayModel(day: "Wed", date: "19"),
    DayModel(day: "Thu", date: "20"),
    DayModel(day: "Fri", date: "21"),
    DayModel(day: "Sat", date: "22"),
    DayModel(day: "Sun", date: "23"),
    DayModel(day: "Mon", date: "24"),
  ];

  final timeModels = [
    TimeModel("00:00", "02:00", 0.1),
    TimeModel("02:00", "04:00", 0.5),
    TimeModel("04:00", "06:00", 0.7),
    TimeModel("06:00", "08:00", 0.2),
    TimeModel("10:00", "12:00", 0.8),
    TimeModel("12:00", "14:00", 0.9),
    TimeModel("14:00", "16:00", 0.4),
    TimeModel("16:00", "18:00", 0.3),
    TimeModel("18:00", "20:00", 0.2),
    TimeModel("20:00", "22:00", 0.6),
    TimeModel("22:00", "24:00", 0.8),
  ];

  late int _selectedMonthIndex;
  int get selectedMonthIndex => _selectedMonthIndex;
  set selectedMonthIndex(int value) {
    _selectedMonthIndex = value;
    notifyListeners();
  }

  late int _selectedDayIndex;
  int get selectedDayIndex => _selectedDayIndex;
  set selectedDayIndex(int value) {
    _selectedDayIndex = value;
    notifyListeners();
  }


  onReady() {
    _selectedMonthIndex = 5;
    _selectedDayIndex = 3;
  }

  void showLogOutDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: S.current.logOut,
      description: S.current.logOutPrompt,
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: S.current.getStarted,
      description: S.current.pleaseWaitWhileWeGatherBayData,
    );
  }

  void logOut() {
    _navigationService.clearStackAndShow(Routes.onboardingView);
  }
}
