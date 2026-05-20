class DiscountMenuData {
  int? cateId;
  int? resId;
  double? price;
  double? rating;
  String? resName;
  String? discountType;
  double? discountValue;
  String? cateName;
  String? discountCode;
  double? minOrder;
  String? discountDescription;
  int? menuId;
  String? description;
  String? name;
  int? isFav;
  String? image;

  DiscountMenuData({
    this.cateId,
    this.resId,
    this.price,
    this.rating,
    this.resName,
    this.discountType,
    this.discountValue,
    this.cateName,
    this.discountCode,
    this.minOrder,
    this.discountDescription,
    this.menuId,
    this.description,
    this.name,
    this.isFav,
    this.image,
  });

  factory DiscountMenuData.fromJson(Map<String, dynamic> json) {
    return DiscountMenuData(
      cateId: json['cateId'],
      resId: json['resId'],
      price: (json['price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      resName: json['resName'],
      discountType: json['discountType'],
      discountValue: (json['discountValue'] as num?)?.toDouble(),
      cateName: json['cateName'],
      discountCode: json['discountCode'],
      minOrder: (json['minOrder'] as num?)?.toDouble(),
      discountDescription: json['discountDescription'],
      menuId: json['menuId'],
      description: json['description'],
      name: json['name'],
      isFav: json['isFav'],
      image: json['image'],
    );
  }
}
