import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modal_bottom_sheet;
import 'package:nxt_test_case/core/extras/constants/app_colors.dart';
import 'package:nxt_test_case/core/extras/services/app-navigation-service/app_navigation_service.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/reservation.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/ticket.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservation-details-page/reservation_details_page_view.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservation-details-page/sub-views/view-items/person_ticket_widget.dart';
import 'package:nxt_test_case/out-buildings/dependency_injector.dart';
import 'package:stacked/stacked.dart';

import 'reservation_info_page_view_model.dart';
import 'sub-views/theme_row_suv_view.dart';
import 'sub-views/view-items/show_info_button_widget.dart';

class ReservationInfoPageArgs {
  final Reservation reservation;
  const ReservationInfoPageArgs(this.reservation,);
}

class ReservationInfoPage extends StatelessWidget {
  static const routeName = "reservation-info-page";
  static const _routeKey = ValueKey("reservation-info-page-view-key",);
  final ReservationInfoPageArgs _args;
  /////////////////////////
  const ReservationInfoPage(this._args,) : super(key: null,);
  /////////////////////////
  @override Widget build(BuildContext context,) {
    return ViewModelBuilder<ReservationInfoPageViewModel>.nonReactive(
      fireOnViewModelReadyOnce: true,
      disposeViewModel: true,
      viewModelBuilder: () => ReservationInfoPageViewModel.create(_args.reservation,),
      onViewModelReady: (ReservationInfoPageViewModel viewModel,) => viewModel.onModelReady(),
      onDispose: (ReservationInfoPageViewModel viewModel,) => viewModel.onPreDispose(),
      builder: (BuildContext buildContext, ReservationInfoPageViewModel viewModel, Widget? child,) {
        return const _ReservationInfoPageView(key: _routeKey,);
      },
    );
  }
}

class _ReservationInfoPageView extends HookWidget {
  const _ReservationInfoPageView({super.key,});
  @override Widget build(BuildContext context,) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final tickets = getParentViewModel<ReservationInfoPageViewModel>(context, listen: false,).reservation.tickets;
    return PopScope(
      child: Scaffold(
        primary: true,
        backgroundColor: isDarkMode ? AppColors.blackColor3 : AppColors.whiteColor5,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40.0,),
              ThemeChangeRowSubView(isDarkMode,),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShowInfoButtonWidget(
                    text: "Open Reservation",
                    textStyle: _textStyle.copyWith(color: isDarkMode ? AppColors.blueColor4 : AppColors.whiteColor4,),
                    backgroundColor: isDarkMode ? AppColors.whiteColor4 : AppColors.blueColor4,
                    borderColor: isDarkMode ? AppColors.whiteColor4 : AppColors.blueColor4,
                    onPressed: () {
                      serviceLocator<AppNavigationService>().pushBottomSheet<void>(
                        isFullPage: true,
                        widgetBuilder: (_,) => BottomSheet(
                          elevation: 0.0,
                          backgroundColor: Colors.transparent,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          builder: (_,) {
                            return ReservationDetailsPage(
                              ReservationDetailsPageArgs(
                                getParentViewModel<ReservationInfoPageViewModel>(context, listen: false).reservation,
                              ),
                            );
                          },
                          onClosing: () => {},
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8.0,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShowInfoButtonWidget(
                    text: "Show IOS Ticket",
                    textStyle: _textStyle.copyWith(color: isDarkMode ? AppColors.whiteColor4 : AppColors.blueColor4,),
                    backgroundColor: Colors.transparent,
                    borderColor: isDarkMode ? AppColors.whiteColor4 : AppColors.blueColor4,
                    onPressed: () {
                      modal_bottom_sheet.showBarModalBottomSheet(
                        context: context,
                        shape: border,
                        clipBehavior: Clip.antiAlias,
                        builder: (_,) => buildTickets(context, tickets,),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8.0,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShowInfoButtonWidget(
                    text: "Show Android Ticket",
                    textStyle: _textStyle.copyWith(color: isDarkMode ? AppColors.whiteColor4 : AppColors.blueColor4,),
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    onPressed: () {
                      modal_bottom_sheet.showMaterialModalBottomSheet(
                        context: context,
                        shape: border,
                        clipBehavior: Clip.antiAlias,
                        builder: (_,) => buildTickets( context, tickets,),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40.0,),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle get _textStyle => const TextStyle(
    color: Colors.black,
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );

  ShapeBorder get border => const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16.0,),
      topRight: Radius.circular(16.0,),
    ),
  );
  Widget buildTickets(BuildContext buildContext, List<Ticket> tickets,) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(buildContext).size.height * 0.60,
      ),
      child: Scaffold(
        primary: true,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              tickets.length,
                (int i,) => Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PersonTicketWidget(ticket: tickets[i],),
                  if((i+1) < tickets.length) const SizedBox(height: 8.0,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
