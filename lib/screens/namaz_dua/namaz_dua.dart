import 'package:flutter/material.dart';
import 'package:salah_learning_prayer/data/namaz_dua_data.dart';
import 'package:salah_learning_prayer/screens/namaz_dua/widgets/dua_card.dart';
import 'package:salah_learning_prayer/screens/settings/setting.dart';

class NamazDuaScreen extends StatelessWidget {
  final int index;

  const NamazDuaScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final dua = namazDuas[index];

    return Scaffold(
      backgroundColor: const Color(0xffF5F6F7),

       appBar: AppBar(
          toolbarHeight: 72,
        elevation: 0,
        centerTitle: false,
        backgroundColor: Color(0xFF016568),

         leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

        title: Text(
          "Salah Dua",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.settings_outlined,
                  color: Colors.white, size: 32),
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
      
      

     body: Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    children: [

      /// ✅ TITLE ABOVE CARD
      Text(
        dua.title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w900,
          color: Color(0xFF016568),
        ),
      ),

      const SizedBox(height: 20),

      
         Center(
          child: DuaCard(
            arabic: dua.arabic,
            translation: dua.translation,
          ),
        ),
      
    ],
  ),
),
    );
  }
}
