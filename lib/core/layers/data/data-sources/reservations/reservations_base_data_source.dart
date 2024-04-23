// ignore_for_file: non_constant_identifier_names
import 'package:dartz/dartz.dart';
import 'package:nxt_test_case/core/extras/services/app-network-service/common_response_model.dart';
import 'package:nxt_test_case/core/extras/services/app-network-service/dio_network_failure_type.dart';

abstract class ReservationsBaseDataSource {
  const ReservationsBaseDataSource();
  Future<Either<NetworkFailureError, CommonResponse>> getReservations();
}