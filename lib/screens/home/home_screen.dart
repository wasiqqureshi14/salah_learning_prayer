import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:salah_learning_prayer/core/utils/prayer_end_helper.dart';
import 'package:salah_learning_prayer/core/utils/prayer_utils.dart';
import 'package:salah_learning_prayer/data/prayers_data.dart';
import 'package:salah_learning_prayer/providers/prayer_provider.dart';
import 'package:salah_learning_prayer/providers/prayer_time_provider.dart';
import 'package:salah_learning_prayer/providers/time_provider.dart';
import 'package:salah_learning_prayer/screens/home/widgets/menu_items.dart';
import 'package:salah_learning_prayer/screens/prayer_detail/prayer_detail_screen.dart';
import 'package:salah_learning_prayer/widgets/qibla_card.dart';
import 'widgets/prayer_card.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF016568), // 👈 your app theme color
      statusBarIconBrightness: Brightness.light, // Android icons
      statusBarBrightness: Brightness.dark, // iOS
    ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: false,
          child: Stack(
            children: [
               CustomScrollView(
              slivers: [
            
                // 🔹 HEADER
               SliverToBoxAdapter(
  child: Stack(
    children: [

      Positioned(
  left: 0,
  right: 0,
  top: 0,
  bottom: -75, // 👈 pushes it slightly down
  child: Opacity(
    opacity: 0.8, // 👈 subtle watermark look
    child: SvgPicture.asset(
      'assets/images/mosque.svg',
      fit: BoxFit.contain,
      alignment: Alignment.center,
    ),
  ),
),

      /// 🔹 COLOR OVERLAY + CONTENT
      Container(
        padding: const EdgeInsets.only(
          top: 50,
          bottom:50,
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
                children:  [
                 
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// 🔹 LIVE DEVICE TIME
      ref.watch(currentTimeProvider).when(
        data: (now) => Text(
         DateFormat('hh:mm a').format(now),
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        loading: () => const Text(
          '--:--',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        error: (_, __) => const Text(
          '--:--',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),

      const SizedBox(height: 4),

      /// 🔹 CURRENT + NEXT PRAYER
      ref.watch(prayerTimesProvider).when(
        data: (times) {
          final now = DateTime.now();
          final currentPrayer = getCurrentPrayer(times, now);
          final nextPrayer = times.nextPrayer();

          final nextTime = times.timeForPrayer(nextPrayer);
          final remaining =
              nextTime!.difference(now);

          final remainingText =
              '${remaining.inHours.toString().padLeft(2, '0')}:'
              '${(remaining.inMinutes % 60).toString().padLeft(2, '0')}';

          return Text(
            'Remaining Time\n           $remainingText',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          );
        },
        loading: () => const Text(
          'Loading prayer time...',
          style: TextStyle(color: Colors.white70),
        ),
        error: (_, __) => const Text(
          'Unable to load prayer time',
          style: TextStyle(color: Colors.white70),
        ),
      ),
    ],
  ),

                ],
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
  height: 120,
  child: ref.watch(prayerTimesProvider).when(
    data: (times) {

      final now = DateTime.now();
      final currentPrayer = times.currentPrayer();

      final prayers = [
        {
          "name": "Fajr",
          "time": times.fajr,
          "icon": Icons.wb_twilight,
          "enum": Prayer.fajr,
        },
        {
          "name": "Zohr",
          "time": times.dhuhr,
          "icon": Icons.wb_sunny,
          "enum": Prayer.dhuhr,
        },
        {
          "name": "Asr",
          "time": times.asr,
          "icon": Icons.cloud,
          "enum": Prayer.asr,
        },
        {
          "name": "Maghrib",
          "time": times.maghrib,
          "icon": Icons.grain,
          "enum": Prayer.maghrib,
        },
        {
          "name": "Isha",
          "time": times.isha,
          "icon": Icons.nightlight_round,
          "enum": Prayer.isha,
        },
      ];

      return ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: prayers.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {

          final prayer = prayers[index];

          final prayerTime = prayer["time"] as DateTime;

          final formattedTime =
              DateFormat('hh:mm a').format(prayerTime);

          final isActive =
              prayer["enum"] == currentPrayer;

          return PrayerCard(
            name: prayer["name"] as String,
            time: formattedTime,
            icon: prayer["icon"] as IconData,
            isActive: isActive,

            onTap: () {

              ref.read(selectedPrayerProvider.notifier).state =
                  prayerData[prayer["name"].toString().toLowerCase()]!;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PrayerDetailScreen(),
                ),
              );
            },
          );
        },
      );
    },

    loading: () => const Center(
      child: CircularProgressIndicator(),
    ),

    error: (_, __) => const Center(
      child: Text("Failed to load prayer times"),
    ),
  ),
),

          ],
        ),
      ),
    ],
  ),
),

            
               SliverToBoxAdapter(
  child: Transform.translate(
    offset: const Offset(0, -10),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ref.watch(prayerTimesProvider).when(
        data: (times) {

          final now = DateTime.now();

          final currentPrayer = times.currentPrayer();

            final endTime = getPrayerEndTime(
              currentPrayer,
              times,
            );

            final formattedEndTime =
                DateFormat('hh:mm a').format(endTime);

          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                Text(
                  "${currentPrayer.name.toUpperCase()} ends at",
                  style: const TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 8),

                Text(
                  formattedEndTime,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF016568),
                  ),
                ),
              ],
            ),
          );
        },

        loading: () => const SizedBox(
          height: 80,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),

        error: (_, __) => const Text(
          "Failed to load prayer times",
        ),
      ),
    ),
  ),
),

            
                // 🔹 GRID MENU
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  sliver: SliverGrid(
                    delegate: SliverChildListDelegate(
                      const [
                        MenuItem(title: 'Salah\nSteps', icon: Icons.directions_walk),
                        MenuItem(title: 'Prayers\nTimes', icon: Icons.access_time),
                        MenuItem(title: 'Qibla\nDirection', icon: Icons.explore),
                        MenuItem(title: 'Namaz\nDua', icon: Icons.menu_book),
                        MenuItem(title: 'Namaz\nFaraiz', icon: Icons.check_circle),
                        MenuItem(title: 'Wudu\nMethod', icon: Icons.water_drop),
                      ],
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
  child: QiblaCard(),
),

              ],
            ),
            Positioned(
        top: 30,
        right: 25,
        child: IconButton(
      icon: const Icon(Icons.settings, size: 35,),
      color: Colors.white,
      onPressed: () {
        // settings navigation
      },
        ),
      ),
      
            ]
          ),
        ),
      ),
    );
  }
}
