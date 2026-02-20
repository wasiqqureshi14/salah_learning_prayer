import 'package:salah_learning_prayer/models/gender.dart';

import '../models/prayer_step.dart';

List<PrayerStep> buildSteps({
   required Gender gender,
  required bool isFirstRakat,
  required bool isLastRakat,
  required bool isSecondRakat,
  required int totalRakats,
  required bool isWitr,
}) {
  final steps = <PrayerStep>[];
  String getImage(String imageName, Gender gender) {
  if (gender == Gender.male) {
    return 'assets/images/male/$imageName';
  } else {
    return 'assets/images/female/$imageName';
  }
}

  // 🔹 Only once in whole prayer
  if (isFirstRakat) {
    steps.addAll([
       PrayerStep(
        order: 1,
        title: 'Niyyah (Intention)',
       image: getImage('p14-01.webp', gender),
        arabic: '  نَوَايْتُ اَنْ اُصَلِّىَ لِلَّهِ تَعَالَى اَرْبَعَ رَكَعَاتِ صَلَوةِ الْظُهْرِ فَرْضُ اللهِ تَعَالَى مُتَوَجِّهًا اِلَى جِهَةِ الْكَعْبَةِ الشَّرِيْفَةِ اَللهُ اَكْبَرُ',
        translation: 'I intend to perform four Rakats of the obligatory Zuhr prayer for Allah Almighty.',
      ),
       PrayerStep(
        order: 2,
        title: 'Takbeer-e-Tahreema:',
        image: getImage('p12-01.webp', gender),
        arabic: 'اللَّهُ أَكْبَر',
        translation: 'Allah is the Greatest.',
      ),
       PrayerStep(
        order: 3,
        title: 'Sana',
        image: getImage('p7-01.webp', gender) ,
        arabic: ' سُبْحَانَكَ اللّٰهُمَّ وَبِحَمْدِكَ وَتَبَارَكَ اسْمُكَ وَتَعَالٰى جَدُّكَ وَلَا إِلٰهَ غَيْرُكَ',
        translation: 'Glory is to You, O Allah, and praise. Blessed is Your Name Exalted is Your Majesty, and there is no god besides You.',
      ),
       PrayerStep(
        order: 4,
        title: 'Ta,awwudh',
        image: getImage('p7-01.webp', gender),
        arabic: 'أَعُوذُ بِاللّٰهِ مِنَ الشَّيْطَانِ الرَّجِيمِ',
        translation: 'In the name of Allah, the Most Merciful,the Most Compassionate.',
      ),
    ]);
  }

  // 🔹 Every rakat core
  steps.addAll([
     PrayerStep(
      order: 5,
      title: ' Tasmiyah',
     image: getImage('p7-01.webp', gender),
      arabic: 'بِسْمِ اللّٰهِ الرَّحْمَٰنِ الرَّحِيمِ ',
      translation: 'In the name of Allah, the Most Merciful,the Most Compassionate.',
    ),
    PrayerStep(
      order: 6,
      title: 'Surah Al-Fatiha',
      image: getImage('p7-01.webp', gender),
      arabic: 'الْحَمْدُ لِلّٰهِ رَبِّ الْعَالَمِينَ الرَّحْمَٰنِ الرَّحِيمِ مَالِكِ يَوْمِ الدِّينِ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ',
      translation: 'All praise is for Allah, the Lord of all worlds. The Most Merciful, the Most Compassionate.  Master of the Day of Judgment. You alone we worship, and You alone we ask for help.Guide us to the straight path. The path of those You have blessed, not of those who earned Youranger nor of those who went astray.',
    ),
    PrayerStep(
      order: 7,
      title: 'Surah Al-Ikhlas',
     image: getImage('p7-01.webp', gender),
      arabic: 'قُلْ هُوَ اللّٰهُ أَحَدٌ اللّٰهُ الصَّمَدُ لَمْ يَلِدْ وَلَمْ يُولَدْ وَلَمْ يَكُنْ لَهُ كُفُوًا أَحَدٌ',
      translation: 'Say: He is Allah, the One. Allah, the Eternal Refuge. He neither begets nor is born. Nor is there to Him any equivalent.',
    ),
     PrayerStep(
      order: 8,
      title: 'Ruku',
      image: getImage('p8-01.webp', gender),
      arabic: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ',
      translation: 'Glory be to my Lord, the Most Great.',
       repeat: 3,
    ),
    PrayerStep(
      order: 9,
      title: 'Standing After Ruku',
     image: getImage('p14-01.webp', gender),
      arabic: 'سَمِعَ اللّٰهُ لِمَنْ حَمِدَهُ رَبَّنَا لَكَ الْحَمْدُ',
      translation: 'Allah hears the one who praises Him. Our Lord, all praise is for You.',
    ),
     PrayerStep(
      order: 10,
      title: 'First Sajda',
     image: getImage('p9-01.webp', gender),
      arabic: 'سُبْحَانَ رَبِّيَ الْأَعْلَى',
      translation: 'Glory be to my Lord, the Most High.',
       repeat: 3,
    ),
    PrayerStep(
      order: 11,
      title: 'Jalsa',
      image: getImage('p11-01.webp', gender),
      arabic: 'رَبِّ اغْفِرْ لِي',
      translation: 'My Lord, forgive me.',
    ),
     PrayerStep(
      order: 12,
      title: 'Second Sajda',
     image: getImage('p9-01.webp', gender),
      arabic: 'سُبْحَانَ رَبِّيَ الْأَعْلَى',
      translation: 'Glory be to my Lord, the Most High.',
       repeat: 3,
    ),
  ]);

  // 🔹 Middle Qaida (after 2nd rakat in 3/4 rakats)
  if (isSecondRakat && totalRakats > 2 && !isLastRakat) {
    steps.add(
       PrayerStep(
        order: 13,
        title: 'Qaida (Tashahhud)',
      image: getImage('p11-01.webp', gender),
        arabic: 'اَلتَّحِيَّاتُ لِلّٰهِ وَالصَّلَوٰتُ وَالطَّيِّبَاتُ، اَلسَّلَامُ عَلَيْكَ أَيُّهَا النَّبِيُّ وَرَحْمَةُ اللّٰهِ وَبَرَكَاتُهُ، اَلسَّلَامُ عَلَيْنَا وَعَلَىٰ عِبَادِ اللّٰهِ الصَّالِحِينَ، أَشْهَدُ أَنْ لَا إِلٰهَ إِلَّا اللّٰهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ',
        translation: 'All compliments, prayers, and pure words are for Allah. Peace be upon you, O Prophet, and the mercy of Allah and His blessings. Peace be upon us and upon the righteous servants of Allah. I bear witness that there is no god except Allah, and I bear witness that Muhammad is His servant and Messenger.',
      ),
    );
  }

  // 🔹 Stand for next rakat
  if (!isLastRakat) {
    steps.add(
       PrayerStep(
        order: 14,
        title: 'Stand for Next Rakat',
       image: getImage('p7-01.webp', gender),
        arabic: 'اللَّهُ أَكْبَر',
        translation: 'Allah is the Greatest.',
      ),
    );
  }

  // 🔹 Final Qaida
  if (isLastRakat) {
    if (isWitr) {
      steps.add(
         PrayerStep(
          order: 15,
          title: 'Qunoot',
        image: getImage('p7-01.webp', gender),
          arabic: 'اللَّهُمَّ اهْدِنِي...',
          translation: 'Dua e Qunoot.',
        ),
      );
    }

    steps.add(
     PrayerStep(
        order: 16,
        title: 'Final Qaida ',
       image: getImage('p11-01.webp', gender),
        arabic: 'اَلتَّحِيَّاتُ لِلّٰهِ وَالصَّلَوٰتُ وَالطَّيِّبَاتُ، اَلسَّلَامُ عَلَيْكَ أَيُّهَا النَّبِيُّ وَرَحْمَةُ اللّٰهِ وَبَرَكَاتُهُ، اَلسَّلَامُ عَلَيْنَا وَعَلَىٰ عِبَادِ اللّٰهِ الصَّالِحِينَ، أَشْهَدُ أَنْ لَا إِلٰهَ إِلَّا اللّٰهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ',
        translation:
            'All compliments, prayers, and pure words are for Allah. Peace be upon you, O Prophet, and the mercy of Allah and His blessings. Peace be upon us and upon the righteous servants of Allah. I bear witness that there is no god except Allah, and I bear witness that Muhammad is His servant and Messenger.',
      ),
    );
    steps.add(
       PrayerStep(
        order: 17,
        title: 'Darood Shareef ',
       image: getImage('p11-01.webp', gender),
        arabic: 'اللّٰهُمَّ صَلِّ عَلَىٰ مُحَمَّدٍ وَعَلَىٰ آلِ مُحَمَّدٍ كَمَا صَلَّيْتَ عَلَىٰ إِبْرَاهِيمَ وَعَلَىٰ آلِ إِبْرَاهِيمَ إِنَّكَ حَمِيدٌ مَجِيدٌ، اللّٰهُمَّ بَارِكْ عَلَىٰ مُحَمَّدٍ وَعَلَىٰ آلِ مُحَمَّدٍ كَمَا بَارَكْتَ عَلَىٰ إِبْرَاهِيمَ وَعَلَىٰ آلِ إِبْرَاهِيمَ إِنَّكَ حَمِيدٌ مَجِيدٌ',
        translation:
            'O Allah, send Your mercy upon Muhammad and the family of Muhammad as You sent mercy upon Ibrahim and the family of Ibrahim. Indeed, You are Praiseworthy and Glorious. O Allah, bless Muhammad and the family of Muhammad as You blessed Ibrahim and the family of Ibrahim. Indeed, You are Praiseworthy and Glorious.',
      ),
    );
    steps.add(
       PrayerStep(
        order: 18,
        title: 'Salam On Left Side ',
       image: getImage('p3-01.webp', gender),
        arabic: 'السَّلَامُ عَلَيْكُمْ',
        translation:
            'Recite Tashahhud, Durood, Dua, then say Salam.',
      ),
    );
    steps.add(
       PrayerStep(
        order: 19,
        title: 'Salam On Right Side ',
       image: getImage('p3-01.webp', gender),
        arabic: 'السَّلَامُ عَلَيْكُمْ',
        translation:
            'Recite Tashahhud, Durood, Dua, then say Salam.',
      ),
    );
  }

  return steps;
}
