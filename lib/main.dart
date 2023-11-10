import 'dart:async';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:mum_health/app/app.bottomsheets.dart';
import 'package:mum_health/app/app.dialogs.dart';
import 'package:mum_health/app/app.locator.dart';
import 'app.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  // await Alarm.init();

  runApp(const MyApp());
}