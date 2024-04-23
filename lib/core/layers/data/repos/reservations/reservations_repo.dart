import 'package:dartz/dartz.dart';
import 'package:nxt_test_case/core/extras/services/app-network-service/dio_network_response_type.dart';
import 'package:nxt_test_case/core/layers/data/data-models/reservation/reservation_dto.dart';

import 'reservations_contract.dart';

class ReservationsRepository extends ReservationsBaseContract {
  const ReservationsRepository(super.reservationsBaseDataSource,);
  /////////////////////////
  @override Future<Either<NetworkResponseError, List<ReservationDto>>> getHotelReservations() async {
    return await reservationsBaseDataSource.getReservations().then(
      (value) => value.fold(
        (l) => Left(NetworkResponseError(statusCode: 0, message: l.toString(),),),
        (r) {
          if (r.data != null) {
            final List<ReservationDto> reservations = [];
            final reservationsData = r.data!.asMap.cast<String, dynamic>();
            final reservationsList = List.of(reservationsData['reservations'],);
            for (final reservation in reservationsList) {
              reservations.add(ReservationDto.fromJson(reservation),);
            }
            return Right(reservations,);
          } else {
            return Left(NetworkResponseError(statusCode: r.code!, message: r.errors?.asList.first,),);
          }
        },
      ),
    );
  }
}