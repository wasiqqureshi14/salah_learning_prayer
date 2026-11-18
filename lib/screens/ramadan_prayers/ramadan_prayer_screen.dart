import 'package:flutter/material.dart';
import 'package:salah_learning_prayer/screens/ramadan_prayers/widgets/prayer_summary_card.dart';
import 'package:salah_learning_prayer/screens/ramadan_prayers/widgets/taraweeh_card.dart';
import 'package:salah_learning_prayer/screens/settings/setting.dart';

class RamadanPrayerScreen extends StatelessWidget {
  const RamadanPrayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: PreferredSize(
         preferredSize: const Size.fromHeight(80),
         child: AppBar(
            elevation: 0,
            centerTitle: false,
            backgroundColor: Color(0xFF016568),
            
             leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
               
            title: Column(
              children: [
                Text(
                  "Ramadan Prayer",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                 Text(
                "Isha Prayer Guide",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                 color: Colors.white,
         
                ),
              ),
              ],
            ),
               
            actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.settings_outlined, color: Colors.white, size: 32,),
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const Settingscreen(),
                        ),
                      );
              },
            ),
          ),
               ],
          ),
       ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
        
              /// ISHA PRAYER CARD
              const PrayerSummaryCard(),
        
              const SizedBox(height: 18),
        
              /// TARAWEEH CARD
              const TaraweehCard(),
        
            ],
          ),
        ),
      ),
    );
  }
}
