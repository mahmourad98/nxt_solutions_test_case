import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nxt_test_case/core/layers/data/data-models/reservation/ticket_dto.dart';

part 'ticket.freezed.dart';

@freezed
class Ticket with _$Ticket {
  const factory Ticket({
    required int id,
    required String seatNumber,
    required String ticketSystemId,
    required String ticketTypeName,
    required String gateNumber,
    required TicketUserData userData,
  }) = _Ticket;

  factory Ticket.from(TicketDto other,){
    return Ticket(
      id: other.id ?? 0,
      seatNumber: other.seatNumber?.toString() ?? 'N/A',
      ticketSystemId: other.ticketSystemId?.toString() ?? 'N/A',
      ticketTypeName: other.ticketTypeName?.toString() ?? 'N/A',
      gateNumber: other.gateNumber?.toString() ?? 'N/A',
      userData: TicketUserData.from(other.userData,),
    );
  }
}

@freezed
class TicketUserData with _$TicketUserData {
  const factory TicketUserData({
    required String firstName,
    required String lastName,
    required String pictureUrl,
    required bool isUser,
  }) = _TicketUserData;

  factory TicketUserData.from(TicketUserDataDto? other,){
    return TicketUserData(
      firstName: other?.firstName?.toString() ?? 'N/A',
      lastName: other?.lastName?.toString() ?? 'N/A',
      pictureUrl: other?.pictureUrl?.toString() ?? '',
      isUser: other?.isUser ?? false,
    );
  }
}