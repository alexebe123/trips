// ignore_for_file: constant_identifier_names

enum Season { Winter, Spring, Summer, Autumn }

enum TripType { Exploration, Recovery, Activities, Therapy }

class Trip {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> activities;
  final List<String> program;
  final int duration;
  final Season season;
  final TripType tripType;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;
  const Trip(
      {required this.activities,
      required this.categories,
      required this.duration,
      required this.id,
      required this.imageUrl,
      required this.isForFamilies,
      required this.isInSummer,
      required this.isInWinter,
      required this.program,
      required this.season,
      required this.title,
      required this.tripType});
}
