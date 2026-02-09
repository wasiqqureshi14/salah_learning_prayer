class PrayerStep {
  final int order;
  final String title;
  final String image; // 👈 ADD THIS
  final String arabic;
  final String translation;
  final int repeat;


  const PrayerStep({
    required this.order,
    required this.title,
    required this.image,
    required this.arabic,
    required this.translation,
     this.repeat = 1,
  });
  
}
