import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/menu_items.dart';
import 'package:salah_learning_prayer/screens/qibla_compass/qibla_compass.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),

      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true, // 🔥 VERY IMPORTANT

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
        ),

        children: [

          MenuItem(
            title: 'Salah\nSteps',
            icon: SvgPicture.asset(
              "assets/icons/praying.svg",
              height: screenHeight * 0.045, // responsive icon
              color: Colors.white,
            ),
            onTap: () {},
          ),

          MenuItem(
            title: 'Prayers\nTimes',
            icon: SvgPicture.asset(
              "assets/icons/prayer times-01.svg",
              height: screenHeight * 0.045,
              color: Colors.white,
            ),
            onTap: () {},
          ),

          MenuItem(
            title: 'Qibla\nDirection',
            icon: SvgPicture.asset(
              "assets/icons/kibla direction-01.svg",
              height: screenHeight * 0.045,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const QiblaDirectionScreen(),
                ),
              );
            },
          ),

          MenuItem(
            title: 'Namaz\nDua',
            icon: SvgPicture.asset(
              "assets/icons/Namaz dua-01.svg",
              height: screenHeight * 0.045,
              color: Colors.white,
            ),
            onTap: () {},
          ),

          MenuItem(
            title: 'Namaz\nFaraiz',
            icon: SvgPicture.asset(
              "assets/icons/isha-01.svg",
              height: screenHeight * 0.045,
              color: Colors.white,
            ),
            onTap: () {},
          ),

          MenuItem(
            title: 'Wudu\nMethod',
            icon: Icon(
              Icons.water_drop_outlined,
              color: Colors.white,
              size: screenHeight * 0.045,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
