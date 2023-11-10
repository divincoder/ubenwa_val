import 'package:mum_health/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:mum_health/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:mum_health/ui/views/home/home_view.dart';
import 'package:mum_health/ui/views/onboarding/onboarding_view.dart';
import 'package:mum_health/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: HomeView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
