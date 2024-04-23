import 'package:flutter/material.dart';
import 'package:nxt_test_case/core/extras/services/app-navigation-service/app_navigation_service.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/reservation.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservation-details-page/reservation_details_page_view.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservation-info-page/reservation_info_page.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservations-list-page/reservation_list_page_view_model.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservations-list-page/sub-views/view-items/reservation_item_view.dart';
import 'package:nxt_test_case/core/layers/presentation/shared-view-components/generic_state_wrapper_on_view_model_widget.dart';
import 'package:nxt_test_case/out-buildings/dependency_injector.dart';
import 'package:stacked/stacked.dart';
import 'package:nxt_test_case/core/extras/constants/app_colors.dart';

class ReservationsListPageView extends StatelessWidget {
  static const routeName = "reservations-list-page";
  static const _routeKey = ValueKey("reservations-list-page-view-key",);
  const ReservationsListPageView() : super(key: null,);
  @override Widget build(BuildContext context,) {
    return ViewModelBuilder<ReservationsListPageViewModel>.nonReactive(
      fireOnViewModelReadyOnce: true,
      disposeViewModel: true,
      viewModelBuilder: () {
        return ReservationsListPageViewModel.create();
      },
      onViewModelReady: (ReservationsListPageViewModel viewModel,) => viewModel.onModelReady(),
      onDispose: (ReservationsListPageViewModel viewModel,) => viewModel.onPreDispose(),
      builder: (BuildContext context, ReservationsListPageViewModel viewModel, Widget? child) {
        return const _ReservationsListPageView(key: _routeKey,);
      },
    );
  }
}

class _ReservationsListPageView extends StatelessWidget {
  const _ReservationsListPageView({super.key,});
  @override Widget build(BuildContext context,) {
    final viewModel = getParentViewModel<ReservationsListPageViewModel>(context, listen: true,);
    return Scaffold(
      appBar: null,
      backgroundColor: AppColors.blackShadowColor,
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,),
          child: RefreshIndicator(
            onRefresh: () async {
              if(!viewModel.isBusy) viewModel.onModelReady();
            },
            color: AppColors.blueColor,
            child: GenericStateWrapperOnViewModel<ReservationsListPageViewModel>(
              payloadWidget: ListView.separated(
                itemBuilder: (_, int index,) {
                  return ReservationItemView(
                    reservation: viewModel.reservations[index],
                    onTap: (Reservation reservation,) {
                      serviceLocator<AppNavigationService>().navigateTo(
                        routeName: ReservationInfoPage.routeName,
                        arguments: ReservationInfoPageArgs(reservation,),
                      );
                    }
                  );
                },
                separatorBuilder: (_, int index,) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0,),
                    child: Divider(color: AppColors.blackColor, thickness: 2.0, height: 2.0,),
                  );
                },
                itemCount: viewModel.reservations.length,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
