import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_compass/flutter_compass.dart';

final compassProvider = StreamProvider<double>((ref) {

  return FlutterCompass.events!.map(
    (event) => event.heading ?? 0,
  );

});
