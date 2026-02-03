import '../models/prayer_step.dart';

List<PrayerStep> buildSteps({
  required bool isFirstRakat,
  required bool isLastRakat,
  required bool isSecondRakat,
  required int totalRakats,
  required bool isWitr,
}) {
  final steps = <PrayerStep>[];

  // 🔹 Only once in whole prayer
  if (isFirstRakat) {
    steps.addAll([
      const PrayerStep(
        order: 1,
        title: 'Niyyah (Intention)',
        image: 'assets/steps/niyyah.png',
        arabic: '  نَوَايْتُ اَنْ اُصَلِّىَ لِلَّهِ تَعَالَى اَرْبَعَ رَكَعَاتِ صَلَوةِ الْظُهْرِ فَرْضُ اللهِ تَعَالَى مُتَوَجِّهًا اِلَى جِهَةِ الْكَعْبَةِ الشَّرِيْفَةِ اَللهُ اَكْبَرُ',
        translation: 'I intend to perform four Rakats of the obligatory Zuhr prayer for Allah Almighty.',
      ),
      const PrayerStep(
        order: 2,
        title: 'Takbeer-e-Tahreema:',
        image: 'assets/steps/takbeer.png',
        arabic: 'اللَّهُ أَكْبَر',
        translation: 'Allah is the Greatest.',
      ),
       const PrayerStep(
        order: 3,
        title: 'Sana',
        image: 'assets/steps/takbeer.png',
        arabic: ' سُبْحَانَكَ اللّٰهُمَّ وَبِحَمْدِكَ وَتَبَارَكَ اسْمُكَ وَتَعَالٰى جَدُّكَ وَلَا إِلٰهَ غَيْرُكَ',
        translation: 'Glory is to You, O Allah, and praise. Blessed is Your Name Exalted is Your Majesty, and there is no god besides You.',
      ),
      const PrayerStep(
        order: 4,
        title: 'Ta,awwudh',
        image: 'assets/steps/takbeer.png',
        arabic: 'أَعُوذُ بِاللّٰهِ مِنَ الشَّيْطَانِ الرَّجِيمِ',
        translation: 'In the name of Allah, the Most Merciful,the Most Compassionate.',
      ),
    ]);
  }

  // 🔹 Every rakat core
  steps.addAll([
    const PrayerStep(
      order: 5,
      title: ' Tasmiyah',
      image: 'assets/steps/qiyam.png',
      arabic: 'بِسْمِ اللّٰهِ الرَّحْمَٰنِ الرَّحِيمِ ',
      translation: 'In the name of Allah, the Most Merciful,the Most Compassionate.',
    ),
    const PrayerStep(
      order: 6,
      title: 'Surah Al-Fatiha',
      image: 'assets/steps/ruku.png',
      arabic: 'الْحَمْدُ لِلّٰهِ رَبِّ الْعَالَمِينَ الرَّحْمَٰنِ الرَّحِيمِ مَالِكِ يَوْمِ الدِّينِ  إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ  صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ',
      translation: 'All praise is for Allah, the Lord of all worlds. /nThe Most Merciful, the Most Compassionate.  Master of the Day of Judgment.  You alone we worship, and You alone we ask for help.Guide us to the straight path. The path of those You have blessed, not of those who earned Youranger nor of those who went astray.',
    ),
    const PrayerStep(
      order: 7,
      title: 'Surah Al-Ikhlas',
      image: 'assets/steps/qauma.png',
      arabic: 'قُلْ هُوَ اللّٰهُ أَحَدٌ اللّٰهُ الصَّمَدُ  لَمْ يَلِدْ وَلَمْ يُولَدْ وَلَمْ يَكُنْ لَهُ كُفُوًا أَحَدٌ',
      translation: 'Say: He is Allah, the One. Allah, the Eternal Refuge.  He neither begets nor is born. Nor is there to Him any equivalent.',
    ),
    const PrayerStep(
      order: 8,
      title: 'Ruku',
      image: 'assets/steps/sajda.png',
      arabic: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ',
      translation: 'Glory be to my Lord, the Most Great.',
    ),
    const PrayerStep(
      order: 9,
      title: 'Standing After Ruku',
      image: 'assets/steps/sajda.png',
      arabic: 'سَمِعَ اللّٰهُ لِمَنْ حَمِدَهُ رَبَّنَا لَكَ الْحَمْدُ',
      translation: 'Allah hears the one who praises Him.  Our Lord, all praise is for You.',
    ),
    const PrayerStep(
      order: 10,
      title: 'First Sajda',
      image: 'assets/steps/sajda.png',
      arabic: 'سُبْحَانَ رَبِّيَ الْأَعْلَى',
      translation: 'Glory be to my Lord, the Most High.',
    ),
    const PrayerStep(
      order: 11,
      title: 'Jalsa',
      image: 'assets/steps/jalsa.png',
      arabic: 'رَبِّ اغْفِرْ لِي',
      translation: 'My Lord, forgive me.',
    ),
    const PrayerStep(
      order: 12,
      title: 'Second Sajda',
      image: 'assets/steps/sajda.png',
      arabic: 'سُبْحَانَ رَبِّيَ الْأَعْلَى',
      translation: 'Glory be to my Lord, the Most High.',
    ),
  ]);

  // 🔹 Middle Qaida (after 2nd rakat in 3/4 rakats)
  if (isSecondRakat && totalRakats > 2 && !isLastRakat) {
    steps.add(
      const PrayerStep(
        order: 13,
        title: 'Qaida (Tashahhud)',
        image: 'assets/steps/qaida.png',
        arabic: 'التَّحِيَّاتُ لِلَّهِ...',
        translation: 'Recite Tashahhud.',
      ),
    );
  }

  // 🔹 Stand for next rakat
  if (!isLastRakat) {
    steps.add(
      const PrayerStep(
        order: 14,
        title: 'Stand for Next Rakat',
        image: 'assets/steps/stand.png',
        arabic: 'اللَّهُ أَكْبَر',
        translation: 'Allah is the Greatest.',
      ),
    );
  }

  // 🔹 Final Qaida
  if (isLastRakat) {
    if (isWitr) {
      steps.add(
        const PrayerStep(
          order: 15,
          title: 'Qunoot',
          image: 'assets/steps/qunoot.png',
          arabic: 'اللَّهُمَّ اهْدِنِي...',
          translation: 'Dua e Qunoot.',
        ),
      );
    }

    steps.add(
      const PrayerStep(
        order: 16,
        title: 'Final Qaida ',
        image: 'assets/steps/salam.png',
        arabic: 'السَّلَامُ عَلَيْكُمْ',
        translation:
            'Recite Tashahhud, Durood, Dua, then say Salam.',
      ),
    );
    steps.add(
      const PrayerStep(
        order: 17,
        title: 'Darood Shareef ',
        image: 'assets/steps/salam.png',
        arabic: 'السَّلَامُ عَلَيْكُمْ',
        translation:
            'Recite Tashahhud, Durood, Dua, then say Salam.',
      ),
    );
    steps.add(
      const PrayerStep(
        order: 18,
        title: 'Salam On Left Side ',
        image: 'assets/steps/salam.png',
        arabic: 'السَّلَامُ عَلَيْكُمْ',
        translation:
            'Recite Tashahhud, Durood, Dua, then say Salam.',
      ),
    );
    steps.add(
      const PrayerStep(
        order: 19,
        title: 'Salam On Right Side ',
        image: 'assets/steps/salam.png',
        arabic: 'السَّلَامُ عَلَيْكُمْ',
        translation:
            'Recite Tashahhud, Durood, Dua, then say Salam.',
      ),
    );
  }

  return steps;
}
