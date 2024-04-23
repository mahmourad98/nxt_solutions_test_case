import 'package:flutter/material.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservation-info-page/reservation_info_page.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservations-list-page/reservation_list_page_view.dart';

class AppRouter{
  const AppRouter._();
  static Route? onGenerateRoute(RouteSettings routeSettings,){
    if(routeSettings.name == Navigator.defaultRouteName) return null;
    switch (routeSettings.name){
      case ReservationsListPageView.routeName:
      return MaterialPageRoute(
        builder: (_,) {
          return const ReservationsListPageView();
        },
        settings: routeSettings,
      );
      case ReservationInfoPage.routeName:
        return MaterialPageRoute(
          builder: (_,) {
            return ReservationInfoPage(routeSettings.arguments as ReservationInfoPageArgs,);
          },
          settings: routeSettings,
        );
      default: return MaterialPageRoute(
        builder: (_,) {
          return Scaffold(body: SizedBox.expand(child: ErrorWidget("unknown-route",),),);
        },
        settings: routeSettings,
      );
    }
  }
}
