class RestaurantModel {
  final int resId;
  final String resName;
  final String imageUrl;
  final String latLng;
  final DateTime openTime;
  final DateTime closeTime;
  final bool isOpen;
  final String description;
  final String estimateTime;
  final String basedCountry;
  final String address;

  RestaurantModel({
    required this.resId,
    required this.resName,
    required this.imageUrl,
    required this.latLng,
    required this.openTime,
    required this.closeTime,
    required this.isOpen,
    required this.description,
    required this.estimateTime,
    required this.basedCountry,
    required this.address,
  });
}
