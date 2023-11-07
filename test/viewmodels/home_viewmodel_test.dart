import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mum_health/app/app.bottomsheets.dart';
import 'package:mum_health/app/app.locator.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/ui/views/home/home_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel _getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('showBottomSheet -', () {
      test('When called, should show custom bottom sheet using notice variant',
          () {
        final bottomSheetService = getAndRegisterBottomSheetService();

        final model = _getModel();
        model.showBottomSheet();
        verify(bottomSheetService.showCustomSheet(
          variant: BottomSheetType.notice,
          title: S.current.getStarted,
          description: S.current.pleaseWaitWhileWeGatherBayData,
        ));
      });
    });
  });
}
