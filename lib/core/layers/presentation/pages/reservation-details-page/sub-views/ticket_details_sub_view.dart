import 'package:flutter/material.dart';
import 'package:nxt_test_case/core/extras/constants/app_colors.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/ticket.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservation-details-page/reservation_details_attributes.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservation-details-page/sub-views/view-items/person_ticket_widget.dart';
import 'package:nxt_test_case/core/layers/presentation/shared-view-components/line_painter.dart';

class TicketsDetailsSubView extends StatelessWidget {
  final List<Ticket> tickets;
  /////////////////////////
  const TicketsDetailsSubView(this.tickets,) : super(key: null,);
  /////////////////////////
  @override Widget build(BuildContext context,) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(tickets.isNotEmpty) ...[
          Text(
            "Tickets:",
            style: titleTextStyle.copyWith(
              fontSize: 24.0,
              color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
            ),
          ),
          const SizedBox(height: 8.0,),
        ],
        if(tickets.isNotEmpty) ...List.generate(
          tickets.length,
          (int i,) => Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PersonTicketWidget(ticket: tickets[i],),
              if((i+1) < tickets.length) const SizedBox(height: 8.0,),
            ],
          ),
        ),
        const SizedBox(height: 32.0,),
        const LinePaint(color: AppColors.greyColor2, withGap: true,),
      ],
    );
  }
}
