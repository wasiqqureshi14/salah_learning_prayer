class DemoPrayerStep {
  final int order;
  final String title;
  final String instruction; // 👈 guided text shown on top
  final String image;

  const DemoPrayerStep({
    required this.order,
    required this.title,
    required this.instruction,
    required this.image,
  });
}