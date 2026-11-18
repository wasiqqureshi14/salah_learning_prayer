
import 'package:flutter_riverpod/legacy.dart';
import '../models/prayer_step.dart';

final prayerStepsProvider =
    StateProvider<List<PrayerStep>>((ref) => []);

final currentStepIndexProvider =
    StateProvider<int>((ref) => 0);
final totalRakatsProvider = StateProvider<int>((ref) => 1);
final currentRakatProvider = StateProvider<int>((ref) => 1);
final rakatTypeProvider = StateProvider<String>((ref) => '');
final selectedRakatTextProvider = StateProvider<String>((ref) => '');
final repeatCountProvider =StateProvider<int>((ref) => 1);


