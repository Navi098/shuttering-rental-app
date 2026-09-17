class LocationModel {
  final String id;
  final String city;
  final String state;
  final String label;

  const LocationModel({
    required this.id,
    required this.city,
    required this.state,
    this.label = '',
  });

  String get displayName => '$city, $state';
}
