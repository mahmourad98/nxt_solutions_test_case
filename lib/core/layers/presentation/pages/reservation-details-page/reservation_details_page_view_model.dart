// ignore_for_file: unnecessary_getters_setters
import 'package:nxt_test_case/core/extras/helpers/base_view_model_helper.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/reservation.dart';
import 'package:nxt_test_case/out-buildings/dependency_injector.dart';
import 'package:stacked/stacked.dart';

class ReservationDetailsPageViewModel extends BaseViewModel with BaseViewModelHelper {
  late final Reservation _reservation;
  set reservation(Reservation value,) => _reservation = value;
  Reservation get reservation => _reservation;
  ReservationDetailsPageViewModel._();
  factory ReservationDetailsPageViewModel.create(Reservation reservation,) {
    final viewModel = ReservationDetailsPageViewModel._()..reservation = reservation;
    serviceLocator.registerSingleton<ReservationDetailsPageViewModel>(viewModel,);
    return viewModel;
  }
  @override void onModelReady() {}
  @override void onPreDispose() {
    serviceLocator.unregister<ReservationDetailsPageViewModel>();
  }
}