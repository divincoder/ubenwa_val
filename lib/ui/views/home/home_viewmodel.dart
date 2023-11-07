import 'package:mum_health/app/app.bottomsheets.dart';
import 'package:mum_health/app/app.dialogs.dart';
import 'package:mum_health/app/app.locator.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

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
