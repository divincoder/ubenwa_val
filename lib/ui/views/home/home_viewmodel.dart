import 'package:mum_health/app/app.bottomsheets.dart';
import 'package:mum_health/app/app.dialogs.dart';
import 'package:mum_health/app/app.locator.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/models/day_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  var nextPredictedCry = "12:40 - 14:30";
  var months = [
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
  var days = [
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

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Hello Mum!',
      description: 'How is your baby doing today?',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: S.current.getStarted,
      description: S.current.pleaseWaitWhileWeGatherBayData,
    );
  }
}
