import 'package:geolocator/geolocator.dart';
import 'package:travelpad/models/address.dart';

class LocationService {
  LocationService._();

  factory LocationService.getInstance() => _instance;
  static final LocationService _instance = LocationService._();

  Geolocator geoLocator = Geolocator();

  Future<Address> getCurrentLocationAddress() async {
    try {
      Position position = await geoLocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .timeout(Duration(seconds: 30), onTimeout: () {
        return null;
      });
      if (position != null) {
        List<Placemark> p = await geoLocator.placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        Placemark place = p[0];
        Address address = Address.fromJson(place.toJson());
        address.longitude = position.longitude;
        address.latitude = position.latitude;
        return address;
      }
      return null;
    } catch (err) {
      return null;
    }
  }
}
