class LocationModel {
  const LocationModel(
      {required this.name, required this.region, required this.country});

  final String name;
  final String region;
  final String country;

  factory LocationModel.fromJson(jsonData) {
    return LocationModel(
        name: jsonData['name'],
        region: jsonData['region'],
        country: jsonData['country']);
  }
}
