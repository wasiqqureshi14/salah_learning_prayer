import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/providers/prayer_faraiz_provider.dart';
import 'package:salah_learning_prayer/screens/namaz_faraiz/widgets/custom_header.dart';
import 'package:salah_learning_prayer/screens/namaz_faraiz/widgets/prayer_faraiz_card.dart';

class NamazFaraizScreen extends ConsumerWidget {
  const NamazFaraizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final prayers = ref.watch(prayerDisplayProvider);

    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      body: SafeArea(
        child: Column(
          children: [

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.28,
              width: double.infinity,
              child: ClipPath(
                clipper: HeaderClipper(),
                child: Stack(
                  children: [
                      Container(
                        color: const Color(0xFF016568),
                      ),
                    
                
                    Positioned(
                      right: 05,
                      bottom: -30,
                      child: Opacity(
                        opacity: 0.25,
                        child: SvgPicture.asset(
                          "assets/images/mosque/mosque.svg",
                            colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                          height: MediaQuery.of(context).size.height * 0.35,
                           fit: BoxFit.contain,
                        ),
                      ),
                    ),
                
                     Positioned(
                      top: 40,
                      left: 05,
                      child: Row(
                        children: [
                        IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),

                              
                          SizedBox(width: 05),
                          Text(
                            "Salah Faraiz",
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
            ),

            /// GRID (NON SCROLLABLE)
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {

                  double itemHeight =
                      (constraints.maxHeight - 90) / 3;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
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

                        return PrayerFaraizCard(
                          title: prayer.name,
                          farzCount: prayer.farzCount,
                         
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
