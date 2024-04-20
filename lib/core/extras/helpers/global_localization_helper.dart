import 'package:nxt_test_case/core/extras/services/app-localization-service/app_localization_service.dart';
import 'package:nxt_test_case/out-buildings/dependency_injector.dart';

String translate(String key,) {
  return serviceLocator<AppLocalizationService>().getLocalizedValue(key,);
}
bool isRTL() {
  return serviceLocator<AppLocalizationService>().isRTL;
}