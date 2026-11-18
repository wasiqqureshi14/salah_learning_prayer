import 'package:salah_learning_prayer/models/wudu_farz_model.dart';

final List<WuduFarzStep> wuduFarzSteps = [

  /// 1. WASH FACE
  WuduFarzStep(
    order: 1,
    title: "Wash the Face",
    image: "assets/images/wudu/wudu-step4.webp",
    arabic:
        "غَسْلُ الْوَجْهِ مِنَ مَنْبَتِ الشَّعْرِ إِلَى الذَّقْنِ وَمِنْ أُذُنٍ إِلَى أُذُنٍ",
    translation:
        "Wash the entire face from the hairline to the chin and from one ear to the other.",
  ),

  /// 2. WASH ARMS INCLUDING ELBOWS
  WuduFarzStep(
    order: 2,
    title: "Wash Both Arms",
    image: "assets/images/wudu/wudu-step5.webp",
    arabic:
        "غَسْلُ الْيَدَيْنِ مَعَ الْمِرْفَقَيْنِ إِلَى الْكُوعَيْنِ",
    translation:
        "Wash both arms including the elbows completely.",
  ),

  /// 3. MASAH OF HEAD
  WuduFarzStep(
    order: 3,
    title: "Wipe the Head (Masah)",
    image: "assets/images/wudu/wudu-step6.webp",
    arabic:
        "مَسْحُ رُبُعِ الرَّأْسِ عَلَى الأَقَلِّ",
    translation:
        "Wipe at least one quarter of the head with wet hands.",
  ),

  /// 4. WASH FEET INCLUDING ANKLES
  WuduFarzStep(
    order: 4,
    title: "Wash Both Feet",
    image: "assets/images/wudu/wudu-step9.webp",
    arabic:
        "غَسْلُ الرِّجْلَيْنِ مَعَ الْكَعْبَيْنِ",
    translation:
        "Wash both feet including the ankles completely.",
  ),
];
