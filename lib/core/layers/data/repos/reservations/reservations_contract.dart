import 'package:dartz/dartz.dart';
import 'package:nxt_test_case/core/extras/services/app-network-service/dio_network_response_type.dart';
import 'package:nxt_test_case/core/layers/data/data-models/reservation/reservation_dto.dart';
import 'package:nxt_test_case/core/layers/data/data-sources/reservations/reservations_base_data_source.dart';

abstract class ReservationsBaseContract {
  final ReservationsBaseDataSource reservationsBaseDataSource;
  /////////////////////////
  const ReservationsBaseContract(this.reservationsBaseDataSource,);
  /////////////////////////
  Future<Either<NetworkResponseError, List<ReservationDto>>> getHotelReservations();
}