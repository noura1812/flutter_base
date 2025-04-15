// import 'package:geolocator/geolocator.dart';

// class GetCurrentLocation {
//   static Future<(Position?, String?)> getCurrentLocation() async {
//     // Added delay for when there are no permissions the loading dialog will not close because of instant response
//     await Future.delayed(const Duration(milliseconds: 100));
//     bool permission = await _isPermissionGranted();
//     if (!permission) {
//       return (null, 'locationPermission');
//     }
//     bool service = await _isServiceEnabled();
//     if (!service) {
//       return (null, 'locationService');
//     }
//     final locationData = await Geolocator.getCurrentPosition();
//     return (locationData, null);
//   }

//   static Future<bool> _isServiceEnabled() async {
//     return await Geolocator.isLocationServiceEnabled();
//   }

//   static Future<bool> _isPermissionGranted() async {
//     LocationPermission? permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return false;
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       return false;
//     }

//     return true;
//   }
// }
