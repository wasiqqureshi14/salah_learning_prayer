import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:salah_learning_prayer/core/services/prayer_services.dart';
import 'package:salah_learning_prayer/models/gender.dart';
import 'package:salah_learning_prayer/providers/gender_provider.dart';
import 'package:salah_learning_prayer/providers/prayer_time_provider.dart';
import 'package:salah_learning_prayer/providers/time_provider.dart';
import 'package:salah_learning_prayer/screens/prayer_detail/prayer_detail_screen.dart';
import 'package:salah_learning_prayer/providers/prayer_provider.dart';
import 'package:salah_learning_prayer/data/prayers_data.dart';
import 'package:salah_learning_prayer/screens/settings/setting.dart';
import 'prayer_card.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return LayoutBuilder(
      builder: (context, constraints) {

        final height = constraints.maxHeight;

        return Stack(
          children: [

            /// ✅ Mosque Background (SAFE)
            Positioned.fill(
              left: 0,
              right: 0,
              top: 0,
              bottom: -80,
              child: Opacity(
                opacity: 0.8,
                child: SvgPicture.asset(
                  'assets/images/mosque/mosque.svg',
                  fit: BoxFit.contain,
                
                ),
              ),
            ),

            /// ✅ MAIN CONTAINER
            Container(
              padding: EdgeInsets.only(
                top: height * 0.10,   // was 50
                bottom: height * 0.10, // was 50
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF016568).withOpacity(0.9),
              ),

              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// TIME
                            ref.watch(currentTimeProvider).when(
                              data: (now) => Text(
                                DateFormat('hh:mm a').format(now),
                                style: TextStyle(
                                  fontSize: height * 0.085, // responsive text
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              loading: () => const Text('--:--',
                                  style: TextStyle(fontSize: 30,color: Colors.white)),
                              error: (_, __) => const Text('--:--',
                                  style: TextStyle(fontSize: 30,color: Colors.white)),
                            ),

                            SizedBox(height: height * 0.01),

                            /// Remaining
                            ref.watch(prayerTimesProvider).when(
                              data: (times) {

                                final now = DateTime.now();
                                final remaining = PrayerService.getRemainingTime(times);

                                   if (remaining == null) {
                                              return Text(
                                                'No Prayer Time Now',
                                                style: TextStyle(
                                                  color: Colors.white54,
                                                  fontSize: height * 0.045,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              );
                                            }

                                    final remainingText =
                                        '${remaining.inHours.toString().padLeft(2, '0')}:'
                                        '${(remaining.inMinutes % 60).toString().padLeft(2, '0')}';

                                return Text(
                                  'Remaining Time\n          $remainingText',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: height * 0.035,
                                    fontWeight: FontWeight.w600
                                  ),
                                );
                              },
                              loading: () => const Text('Loading prayer time...',
                                  style: TextStyle(color: Colors.white70)),
                              error: (_, __) => const Text('Unable to load prayer time',
                                  style: TextStyle(color: Colors.white70)),
                            ),
                          ],
                        ),
                        IconButton(
  icon: const Icon(Icons.settings_outlined,
      size: 32,
      color: Colors.white),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const Settingscreen(),
      ),
    );
  },
)


                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.08),

                  
                  Expanded(
                    child: ref.watch(prayerTimesProvider).when(
                      data: (times) {

                        final currentPrayer = times.currentPrayer();

                        final prayers = [
                          {"name": "Fajr",
                          "time": times.fajr,
                          "icon": "assets/icons/fajar-01.svg",
                          "enum": Prayer.fajr
                          },
                          {"name": "Dhuhr",
                          "time": times.dhuhr,
                          "icon": "assets/icons/zohr-01.svg",
                          "enum": Prayer.dhuhr
                          },
                          {"name": "Asr",
                          "time": times.asr,
                          "icon": "assets/icons/asr-01.svg",
                          "enum": Prayer.asr
                          },
                          {"name": "Maghrib",
                          "time": times.maghrib,
                          "icon": "assets/icons/magrib-01.svg",
                          "enum": Prayer.maghrib
                          },
                          {"name": "Isha",
                          "time": times.isha,
                          "icon": "assets/icons/isha-01.svg",
                          "enum": Prayer.isha
                          },
                        ];

                       return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: prayers.map((prayer) {

                            final prayerTime = prayer["time"] as DateTime;
                            

                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: PrayerCard(
                                  name: prayer["name"] as String,
                                  time: DateFormat('hh:mm a').format(prayerTime),
                                  icon: SvgPicture.asset(
                                    prayer["icon"] as String,
                                    color: Colors.white,
                                  ),
                                  isActive: prayer["enum"] == currentPrayer,
                                  onTap: () {

                                    ref.read(selectedPrayerProvider.notifier).state =
                                        prayerData[prayer["name"]
                                            .toString()
                                            .toLowerCase()]!;

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const PrayerDetailScreen(),
                                      ),
                                    );
                                    if (!context.mounted) return;
                                  },
                                ),
                              ),
                            );

                          }).toList(),
                        )

                      );

                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (_, __) =>
                          const Center(child: Text("Failed to load prayer times")),
                    ),
                  ),
                ],
              ),
            ),

            
          ],
        );
      },
    );
  }
}
