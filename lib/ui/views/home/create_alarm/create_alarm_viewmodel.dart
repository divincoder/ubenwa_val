import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:mum_health/app/app.locator.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/ui/views/home/create_alarm/create_alarm_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateAlarmViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final context = StackedService.navigatorKey?.currentContext;

  late bool creating;
  late DateTime selectedDateTime;
  late bool _loopAudio;
  late bool _vibrate;
  late bool _volumeMax;
  late bool _showNotification;
  late String _assetAudio;

  bool get loopAudio => _loopAudio;
  set loopAudio(bool value) {
    _loopAudio = value;
    notifyListeners();
  }

  bool get vibrate => _vibrate;
  set vibrate(bool value) {
    _vibrate = value;
    notifyListeners();
  }

  bool get volumeMax => _volumeMax;
  set volumeMax(bool value) {
    _volumeMax = value;
    notifyListeners();
  }

  bool get showNotification => _showNotification;
  set showNotification(bool value) {
    _showNotification = value;
    notifyListeners();
  }

  String get assetAudio => _assetAudio;
  set assetAudio(String value) {
    _assetAudio = value;
    notifyListeners();
  }

  onReady() {
    selectedDateTime = DateTime.now().add(const Duration(minutes: 1));
    selectedDateTime = selectedDateTime.copyWith(second: 0, millisecond: 0);
    loopAudio = true;
    vibrate = true;
    volumeMax = false;
    showNotification = true;
    assetAudio = 'assets/marimba.mp3';
  }

  String getDay() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final difference = selectedDateTime.difference(today).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Tomorrow';
    } else if (difference == 2) {
      return 'After tomorrow';
    } else {
      return 'In $difference days';
    }
  }

  Future<void> pickTime() async {
    if (context != null) {
      final res = await showTimePicker(
        initialTime: TimeOfDay.fromDateTime(selectedDateTime),
        context: context!,
      );

      if (res != null) {
        selectedDateTime = selectedDateTime.copyWith(
          hour: res.hour,
          minute: res.minute,
        );
        if (selectedDateTime.isBefore(DateTime.now())) {
          selectedDateTime = selectedDateTime.add(const Duration(days: 1));
        }
      }
    }
  }

  AlarmSettings buildAlarmSettings() {
    final id = DateTime.now().millisecondsSinceEpoch % 10000;

    final alarmSettings = AlarmSettings(
      id: id,
      dateTime: selectedDateTime,
      loopAudio: loopAudio,
      vibrate: vibrate,
      volumeMax: volumeMax,
      notificationTitle: showNotification ? S.current.cryAlert : null,
      notificationBody: showNotification ? S.current.cryAlertDesc : null,
      assetAudioPath: assetAudio,
    );
    return alarmSettings;
  }

  void saveAlarm() {
    setBusy(true);
    _navigationService.back(result: true);
    // Alarm.set(alarmSettings: buildAlarmSettings()).then((res) {
    //   if (res) _navigationService.back(result: true);
    // });
    setBusy(false);
  }
}
