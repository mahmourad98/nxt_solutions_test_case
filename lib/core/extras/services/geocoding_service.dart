import 'package:geocoding/geocoding.dart';
class GeoCodingService {
  static Future<String?> getAddressFromLatLong(double latitude, double longitude,) async {
    try {
      final placeMarks = await placemarkFromCoordinates(latitude, longitude,);
      Placemark place = placeMarks.first;
      String address = "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
      return address;
    } catch (e) {
      print(e);
      return null;
    }
  }
}