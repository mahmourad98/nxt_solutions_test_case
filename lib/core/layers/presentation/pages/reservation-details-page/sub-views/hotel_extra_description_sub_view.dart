import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/hotel_reservation.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservation-details-page/reservation_details_attributes.dart';

class HotelExtraDescriptionSubView extends StatelessWidget {
  final HotelReservation hotelReservation;
  ////////////////////
  const HotelExtraDescriptionSubView(this.hotelReservation,) : super(key: null,);
  /////////////////////////
  List<String> get imageUrls => [...hotelReservation.images, ...hotelReservation.images,];
  @override Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description:",
          style: titleTextStyle.copyWith(
            fontSize: 24.0,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: HtmlWidget(
                hotelReservation.description,
                renderMode: RenderMode.column,
              ),
            ),
          ],
        ),
        const SizedBox(height: 36.0,),
        Text(
          "Gallery:",
          style: titleTextStyle.copyWith(
            fontSize: 24.0,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 8.0,),
        SizedBox.fromSize(
          size: const Size.fromHeight(224.0,),
          child: ScrollConfiguration(
            behavior: const ScrollBehavior()..copyWith(scrollbars: false, overscroll: false,),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll,) {
                overscroll.disallowIndicator();
                return false;
              },
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                controller: ScrollController(),
                physics: const ClampingScrollPhysics(),
                clipBehavior: Clip.antiAlias,
                scrollDirection: Axis.horizontal,
                itemCount: imageUrls.length,
                itemBuilder: (_, int i,) {
                  final isLast = i == (imageUrls.length - 1);
                  return Container(
                    constraints: const BoxConstraints.tightForFinite(width: 152.0,),
                    margin: EdgeInsetsDirectional.only(end: (isLast) ? 0.0 : 10.0,),
                    child: Image.network(
                      imageUrls[i],
                      fit: BoxFit.cover,
                    ),
                  );
                }
              ),
            ),
          ),
        ),
        const SizedBox(height: 36.0,),
        Text(
          "Amenities:",
          style: titleTextStyle.copyWith(
            fontSize: 24.0,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 8.0,),
        Text(
          hotelReservation.amenities,
          style: subtitleTextStyle.copyWith(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}
