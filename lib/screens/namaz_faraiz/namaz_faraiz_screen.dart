import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salah_learning_prayer/screens/namaz_faraiz/widgets/custom_header.dart';
import 'package:salah_learning_prayer/screens/namaz_faraiz/widgets/prayer_card.dart';

class NamazFaraizScreen extends StatelessWidget {
  const NamazFaraizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      body: SafeArea(
        child: Column(
          children: [

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.28,
              width: double.infinity,
              child: Stack(
                children: [

                  /// Curved Background
                  ClipPath(
                    clipper: HeaderClipper(),
                    child: Container(
                      color: const  Color(0xFF016568),
                    ),
                  ),

                  /// Mosque Image RIGHT SIDE
                  Positioned.fill(
                    top: 15,
                    right: -120,
                    bottom: -10,                
                     left: 50,
                        child: Opacity(
                          opacity: 0.25,
                          child: SvgPicture.asset(
                            "assets/images/mosque/mosque.svg",
                          fit: BoxFit.contain,
                          ),
                        ),
                  ),

                  /// Title Row
                  const Positioned(
                    top: 40,
                    left: 16,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios_new_outlined,
                            color: Colors.white),
                        SizedBox(width: 30),
                        Text(
                          "Namaz Faraiz",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {

                  double itemHeight =
                      (constraints.maxHeight - 90) / 3;

                  return Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                    child: GridView.builder(
                      physics:
                          const NeverScrollableScrollPhysics(),
                      itemCount: prayers.length,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 18,
                        mainAxisSpacing: 18,
                        mainAxisExtent: itemHeight,
                      ),
                      itemBuilder: (context, index) {
                        final prayer = prayers[index];
                        return PrayerCard(
                          title: prayer.title,
                          rakaat: prayer.rakaat,
                          icon: prayer.icon,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

