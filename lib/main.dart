import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mum_health/app/app.bottomsheets.dart';
import 'package:mum_health/app/app.dialogs.dart';
import 'package:mum_health/app/app.locator.dart';
import 'app.dart';

FutureOr<void> main() async {
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MyApp());
}