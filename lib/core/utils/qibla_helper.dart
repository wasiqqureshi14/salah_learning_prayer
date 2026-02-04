import 'dart:math';

double calculateQiblaDirection(
  double userLat,
  double userLng,
) {

  const kaabaLat = 21.4225;
  const kaabaLng = 39.8262;

  final lat1 = userLat * pi / 180;
  final lng1 = userLng * pi / 180;

  final lat2 = kaabaLat * pi / 180;
  final lng2 = kaabaLng * pi / 180;

  final dLng = lng2 - lng1;

  final y = sin(dLng);
  final x = cos(lat1) * tan(lat2) -
      sin(lat1) * cos(dLng);

  final direction = atan2(y, x);

  return (direction * 180 / pi + 360) % 360;
}
