import 'package:nxt_test_case/core/extras/services/app_theme_service.dart';
import 'package:nxt_test_case/core/layers/domain/usecases/reservations/reservations_usecase.dart';
import 'package:nxt_test_case/out-buildings/dependency_injector.dart';
import 'package:stacked/stacked.dart';

class AppViewController extends ReactiveViewModel {
  AppThemeService get _appThemeService => serviceLocator<AppThemeService>();
  void onPreDispose() {
    _appThemeService.removeAllListeners();
  }
  void onModelReady() {
    _appThemeService.addNewListener(notifyListeners,);
  }
}
