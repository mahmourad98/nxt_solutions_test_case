import 'package:dartz/dartz.dart';
import 'package:nxt_test_case/core/extras/helpers/general_exception_or_error.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/reservation.dart';
import 'reservations_base_usecase.dart';

class FetchReservationsUsecase extends ReservationsBaseUsecase<void, List<Reservation>> {
  FetchReservationsUsecase(super.reservationsBaseContract,);
  /////////////////////////
  @override Future<Either<GeneralError, List<Reservation>>> call() async{
    return await reservationsBaseContract.getHotelReservations().then(
      (value,) => value.fold(
        (l,) => Left(GeneralError(message: l.toString(),),),
        (r,) {
          final List<Reservation> reservations = [];
          for (final reservationDto in r) {
            reservations.add(Reservation.from(reservationDto),);
          }
          return Right(reservations,);
        },
      ),
    );
  }
}