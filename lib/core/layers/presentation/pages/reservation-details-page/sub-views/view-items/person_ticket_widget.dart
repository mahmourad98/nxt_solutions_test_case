import 'package:flutter/material.dart';
import 'package:nxt_test_case/core/extras/constants/app_colors.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/ticket.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservation-details-page/reservation_details_attributes.dart';
import 'package:nxt_test_case/core/layers/presentation/shared-view-components/line_painter.dart';
class PersonTicketWidget extends StatelessWidget {
  final Ticket ticket;
  const PersonTicketWidget({super.key, required this.ticket,});
  @override Widget build(BuildContext context,) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        SizedBox.fromSize(
          size: const Size.fromHeight(152.0,),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isDarkMode ? AppColors.silverColor2 : AppColors.silverColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(0.0, 2.0,),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 16.0, end: 16.0,),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0,),
                              child: Container(
                                width: 36.0,
                                height: 36.0,
                                decoration: const BoxDecoration(
                                  color: AppColors.whiteColor,
                                  shape: BoxShape.circle,
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  ticket.userData.pictureUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0,),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${ticket.userData.firstName} ${ticket.userData.lastName}",
                                style: titleTextStyle.copyWith(
                                  color: isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                              Text(
                                "#${ticket.ticketSystemId}",
                                style: subtitleTextStyle.copyWith(
                                  color: isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Ticket Type: ",
                                    style: subtitleTextStyle.copyWith(
                                      color: isDarkMode ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ticket.ticketTypeName,
                                    style: subtitleTextStyle.copyWith(
                                      color: isDarkMode ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Seat: ",
                                    style: subtitleTextStyle.copyWith(
                                      color: isDarkMode ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ticket.seatNumber,
                                    style: subtitleTextStyle.copyWith(
                                      color: isDarkMode ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        PositionedDirectional(
          top: 0.0,
          bottom: 0.0,
          start: -8.0,
          child: _circleWidget(isDarkMode,),
        ),
        PositionedDirectional(
          top: 0.0,
          bottom: 0.0,
          child: SizedBox(
            width: MediaQuery.of(context,).size.width,
            child: LinePaint(
              color: isDarkMode ? AppColors.blackColor2 : AppColors.whiteColor2,
              withGap: true,
            ),
          ),
        ),
        PositionedDirectional(
          top: 0.0,
          bottom: 0.0,
          end: -8.0,
          child: _circleWidget(isDarkMode,),
        ),
      ],
    );
  }
  ////////////////////////////////
  Widget _circleWidget(bool isDarkMode,) => DecoratedBox(
    decoration: BoxDecoration(
      color: isDarkMode ? AppColors.blackColor2 : AppColors.whiteColor2,
      shape: BoxShape.circle,
    ),
    child: const SizedBox.square(dimension: 16.0,),
  );
}

