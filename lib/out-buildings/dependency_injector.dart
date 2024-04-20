import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nxt_test_case/core/extras/services/app-localization-service/app_localization_service.dart';
import 'package:nxt_test_case/core/extras/services/app-navigation-service/app_navigation_service.dart';
import 'package:nxt_test_case/core/extras/services/app-network-service/dio_network_service.dart';

final serviceLocator = GetIt.instance;
Future setupServiceLocator() async {
  ///Must be in orders dependencies
  {
    serviceLocator.registerSingleton<AppNavigationService>(AppNavigationService(),);
    /////////////////////////
    serviceLocator.registerSingleton<AppLocalizationService>(AppLocalizationService(),);
    await serviceLocator<AppLocalizationService>().initAppLocaleFromDB();
    /////////////////////////
    serviceLocator.registerSingleton<Dio>(Dio(),);
    serviceLocator.registerLazySingleton<DioNetworkService>(() => DioNetworkService.create(serviceLocator<Dio>(),),);
  }
}
