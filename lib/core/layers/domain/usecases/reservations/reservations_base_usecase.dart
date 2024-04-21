import 'package:dartz/dartz.dart';
import 'package:nxt_test_case/core/extras/helpers/general_exception_or_error.dart';
import 'package:nxt_test_case/core/layers/data/repos/reservations/reservations_contract.dart';
abstract class ReservationsBaseUsecase<S, T> {
  final ReservationsBaseContract reservationsBaseContract;
  /////////////////////////
  const ReservationsBaseUsecase(this.reservationsBaseContract,);
  /////////////////////////
  Future<Either<GeneralError, T>> call();
}