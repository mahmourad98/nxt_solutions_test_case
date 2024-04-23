import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nxt_test_case/core/extras/constants/app_colors.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/reservation.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservation-details-page/reservation_details_attributes.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservation-details-page/sub-views/single_hotel_reservation_sub_view.dart';
import 'package:stacked/stacked.dart';

import 'reservation_details_page_view_model.dart';

class ReservationDetailsPageArgs {
  final Reservation reservation;
  const ReservationDetailsPageArgs(this.reservation,);
}

class ReservationDetailsPage extends StatelessWidget {
  static const routeName = ValueKey("single-reservation-page",);
  static const _routeKey = ValueKey("single-reservation-page-view-key",);
  final ReservationDetailsPageArgs _args;
  /////////////////////////
  const ReservationDetailsPage(this._args,) : super(key: null,);
  /////////////////////////
  @override Widget build(BuildContext context,) {
    return ViewModelBuilder<ReservationDetailsPageViewModel>.nonReactive(
      fireOnViewModelReadyOnce: true,
      disposeViewModel: true,
      viewModelBuilder: () {
        return ReservationDetailsPageViewModel.create(_args.reservation,);
      },
      onViewModelReady: (ReservationDetailsPageViewModel viewModel,) => viewModel.onModelReady(),
      onDispose: (ReservationDetailsPageViewModel viewModel,) => viewModel.onPreDispose(),
      builder: (BuildContext buildContext, ReservationDetailsPageViewModel viewModel, Widget? child,) {
        return const _ReservationDetailsPageView(key: _routeKey,);
      },
    );
  }
}

class _ReservationDetailsPageView extends HookWidget {
  const _ReservationDetailsPageView({super.key,});
  EdgeInsetsGeometry get _scrollViewPadding => const EdgeInsets.symmetric(horizontal: 24.0, );
  @override Widget build(BuildContext context,) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return DraggableScrollableSheet(
      initialChildSize: 0.80,
      minChildSize: 0.50,
      maxChildSize: 1.0,
      builder: (_, ScrollController scrollController,) {
          return Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: isDarkMode ? AppColors.blackColor : AppColors.whiteColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32.0,),
                topRight: Radius.circular(32.0,),
              ),
            ),
            child: ScrollConfiguration(
              behavior: const ScrollBehavior()..copyWith(scrollbars: false, overscroll: false,),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll,) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: CustomScrollView(
                  primary: false,
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  clipBehavior: Clip.antiAlias,
                  scrollDirection: Axis.vertical,
                  slivers: [
                    ///BOTTOM SHEET PERSISTENT HEADER BAR
                    SliverPersistentHeader(
                      delegate: SheetSliverPersistentHeaderDelegate(
                        child: SizedBox.fromSize(
                          size: const Size.fromHeight(32.0,),
                          child: const DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.greyColor3,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 56.0,
                                  height: 6.0,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(Radius.circular(8.0,),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      pinned: true,
                      floating: false,
                    ),
                    ///HEADER IMAGE CONTAINER
                    SliverToBoxAdapter(
                      child: SizedBox.fromSize(
                        size: const Size.fromHeight(300.0,),
                        child: SelectorViewModelBuilder<ReservationDetailsPageViewModel, Reservation>(
                          builder: (BuildContext buildContext, Reservation reservation, __,) {
                            return Image.network(
                              reservation.hotelReservations.first.images.first,
                              fit: BoxFit.fill,
                            );
                          },
                          selector: (ReservationDetailsPageViewModel viewModel) => viewModel.reservation,
                        ),
                      ),
                    ),
                    ///GAP
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 32.0,),
                    ),
                    ///RESERVATION TITLE
                    SliverPadding(
                      padding: _scrollViewPadding,
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hotel Check-in",
                              style: titleTextStyle.copyWith(
                                fontSize: 24.0,
                                color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
                              ),
                            ),
                            const SizedBox(height: 8.0,),
                            SelectorViewModelBuilder<ReservationDetailsPageViewModel, Reservation>(
                              builder: (BuildContext buildContext, Reservation reservation, __,) {
                                final singleReservation = reservation.hotelReservations.length == 1;
                                return Text(
                                  (singleReservation) ? reservation.hotelReservations.first.name : "Multiple Hotel Reservation",
                                  style: subtitleTextStyle.copyWith(
                                    color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
                                  ),
                                );
                              },
                              selector: (ReservationDetailsPageViewModel viewModel,) => viewModel.reservation,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ///GAP
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 32.0,),
                    ),
                    ///RESERVATION HOTELS
                    SelectorViewModelBuilder<ReservationDetailsPageViewModel, Reservation>(
                      builder: (BuildContext buildContext, Reservation reservation, __,) {
                        return SliverPadding(
                          padding: _scrollViewPadding,
                          sliver: HotelReservationsSubView(reservation,),
                        );
                      },
                      selector: (ReservationDetailsPageViewModel viewModel,) => viewModel.reservation,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
    );
  }
}

class SheetSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  SheetSliverPersistentHeaderDelegate({required this.child,});
  @override double get minExtent => 32.0;
  @override double get maxExtent => 32.0;
  @override Widget build(BuildContext context, double shrinkOffset, bool overlapsContent,) { return child; }
  @override bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate,) { return false; }
}
