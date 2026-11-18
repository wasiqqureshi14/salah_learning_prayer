import 'package:salah_learning_prayer/models/common_salah_model.dart';
import '../models/gender.dart';

List<DemoPrayerStep> buildDemoSteps(Gender gender) {

  String img(String name) {
    return gender == Gender.male
        ? 'assets/images/male/$name'
        : 'assets/images/female/$name';
  }

  return [

    DemoPrayerStep(
      order: 1,
      title: "Niyyah",
      instruction: "Make intention in your heart and stand facing Qibla.",
      image: img('p14-01.webp'),
    ),

    DemoPrayerStep(
      order: 2,
      title: "Takbeer",
      instruction: "Raise both hands and say Allah O Akbar.",
      image: img('p12-01.webp'),
    ),

    DemoPrayerStep(
      order: 3,
      title: "Qiyam",
      instruction: "Stand with hands folded and begin recitation.",
      image: img('p7-01.webp'),
    ),

    DemoPrayerStep(
      order: 4,
      title: "Ruku",
      instruction: "Bow down placing hands on knees.",
      image: img('p8-01.webp'),
    ),

    DemoPrayerStep(
      order: 5,
      title: "Stand After Ruku",
      instruction: "Stand straight while praising Allah.",
      image: img('p14-01.webp'),
    ),

    DemoPrayerStep(
      order: 6,
      title: "First Sajda",
      instruction: "Go into prostration placing forehead on ground.",
      image: img('p9-01.webp'),
    ),

    DemoPrayerStep(
      order: 7,
      title: "Jalsa",
      instruction: "Sit briefly between two prostrations.",
      image: img('p11-01.webp'),
    ),

    DemoPrayerStep(
      order: 8,
      title: "Second Sajda",
      instruction: "Perform second prostration.",
      image: img('p9-01.webp'),
    ),

    DemoPrayerStep(
      order: 9,
      title: "Qaida",
      instruction: "Sit calmly and prepare to end prayer.",
      image: img('p11-01.webp'),
    ),

    DemoPrayerStep(
      order: 10,
      title: "Salam",
      instruction: "Turn head right and left saying Salam.",
      image: img('p3-01.webp'),
    ),
  ];
}