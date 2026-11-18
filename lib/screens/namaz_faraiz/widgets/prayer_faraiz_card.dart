import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrayerFaraizCard extends StatelessWidget {
  final String title;
  final int farzCount;

  const PrayerFaraizCard({
    super.key,
    required this.title,
    required this.farzCount,
  });

  Widget _buildVisual() {

    switch (title.toLowerCase()) {

      case 'fajr':
        return SvgPicture.asset(
                "assets/icons/fajar-01.svg",
                height: 50,
                  colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
              );

      case 'dhuhr':
        return SvgPicture.asset("assets/icons/zohr-01.svg",
        height: 50,
          colorFilter: const ColorFilter.mode(
      Colors.white,
      BlendMode.srcIn,
    ),
        );

      case 'asr':
        return SvgPicture.asset("assets/icons/asr-01.svg",
        height: 50,
          colorFilter: const ColorFilter.mode(
      Colors.white,
      BlendMode.srcIn,
    ),);

      case 'maghrib':
        return SvgPicture.asset("assets/icons/magrib-01.svg",
        height: 50,
          colorFilter: const ColorFilter.mode(
      Colors.white,
      BlendMode.srcIn,
    ),);
    
      case 'isha':
        return SvgPicture.asset("assets/icons/isha-01.svg", 
        height: 50,
          colorFilter: const ColorFilter.mode(
      Colors.white,
      BlendMode.srcIn,
    ),);

      case 'jummah':
        return SvgPicture.asset("assets/icons/zohr-01.svg",
        height: 50,
          colorFilter: const ColorFilter.mode(
      Colors.white,
      BlendMode.srcIn,
    ),
        );

      default:
        return const Icon(Icons.mosque,
            color: Colors.white, size: 36);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF016568),
        borderRadius: BorderRadius.circular(18),
      ),


      
    child: ClipRRect(
       borderRadius: BorderRadius.circular(18),
      child: Stack(
        children: [
      
          /// BACKGROUND MOSQUE
          Positioned(
            right: 0,
            bottom: -30,
            left: 0,
            top: 20,
            child: Opacity(
              opacity: 0.15,
              child: SvgPicture.asset(
                "assets/images/mosque/mosque.svg",
               colorFilter: const ColorFilter.mode(
      Colors.white,
      BlendMode.srcIn,
    ),
                fit: BoxFit.contain,
              ),
              
            ),
          ),
         Center(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildVisual(),

              Text(
                "$title\n($farzCount Farz)",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
                   ),
         ),
        ]
      
         ),
    )
    );
  }
}
