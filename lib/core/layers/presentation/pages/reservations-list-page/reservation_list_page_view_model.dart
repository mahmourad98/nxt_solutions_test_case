import 'package:nxt_test_case/core/extras/helpers/base_view_model_helper.dart';
import 'package:nxt_test_case/core/extras/helpers/general_exception_or_error.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/reservation.dart';
import 'package:nxt_test_case/core/layers/domain/usecases/reservations/reservations_usecase.dart';
import 'package:nxt_test_case/out-buildings/dependency_injector.dart';
import 'package:stacked/stacked.dart';

class ReservationsListPageViewModel extends BaseViewModel with BaseViewModelHelper {
  late final _fetchReservationsUsecase =  serviceLocator<FetchReservationsUsecase>();
  late final List<Reservation> _reservations = [];
  List<Reservation> get reservations => _reservations;
  ReservationsListPageViewModel._();
  factory ReservationsListPageViewModel.create() {
    final viewModel = ReservationsListPageViewModel._();
    serviceLocator.registerSingleton<ReservationsListPageViewModel>(viewModel,);
    return serviceLocator<ReservationsListPageViewModel>();
  }
  Future<void> _getReservationsList() async {
    await Future.delayed(const Duration(seconds: 5,),);
    final results = await _fetchReservationsUsecase();
    results.fold(
      (GeneralError l,) => setError(l,),
      _updateReservationsList,
    );
  }
  void _updateReservationsList(List<Reservation> r,) {
    (_reservations..clear()).addAll(r,);
    _reservations.shuffle();
    return notifyListeners();
  }
  @override void onPreDispose() {
    serviceLocator.unregister(instance: serviceLocator<ReservationsListPageViewModel>(),);
  }
  @override void onModelReady() async{
    runBusyFuture(_getReservationsList(),);
  }
}