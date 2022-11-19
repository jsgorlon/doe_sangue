import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationServices {
  Position? currentPosition;
  Placemark? place;
  String? city;
  String? state;

  getCurrentLocation() async {
    await _getPermission();
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    await _getAddressFromLatLng();
    return place;
  }

  _getPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  _getAddressFromLatLng() async {
    try {
      await placemarkFromCoordinates(
              currentPosition!.latitude, currentPosition!.longitude)
          .then((value) {
        place = value[0];
        city = place?.subAdministrativeArea;
      });
    } catch (e) {
      print(e);
    }
  }
}
