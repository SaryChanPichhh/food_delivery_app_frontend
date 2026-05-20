class RestaurantModel {
  bool? success;
  String? message;
  List<RestaurantData>? data;

  RestaurantModel({this.success, this.message, this.data});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <RestaurantData>[];
      json['data'].forEach((v) {
        data!.add(RestaurantData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RestaurantData {
  double? value;
  String? resId;
  int? qty;
  double? rating;
  String? code;
  bool? isOpen;
  String? resName;
  String? latLng;
  String? discountType;
  String? imageUrl;
  String? basedCountry;
  String? popularDish;
  String? estimateTime;
  int? isFav;

  RestaurantData(
      {this.value,
      this.resId,
      this.qty,
      this.rating,
      this.code,
      this.isOpen,
      this.resName,
      this.latLng,
      this.discountType,
      this.imageUrl,
      this.basedCountry,
      this.popularDish,
      this.estimateTime,
      this.isFav});

  RestaurantData.fromJson(Map<String, dynamic> json) {
    value = json['value'] != null ? json['value'].toDouble() : null;
    resId = json['resId']?.toString();
    qty = json['qty'];
    rating = json['rating'] != null ? json['rating'].toDouble() : null;
    code = json['code'];
    isOpen = json['isOpen'];
    resName = json['resName'];
    latLng = json['latLng'];
    discountType = json['discountType'];
    imageUrl = json['imageUrl'];
    basedCountry = json['basedCountry'];
    popularDish = json['popularDish'];
    estimateTime = json['estimateTime']?.toString();
    isFav = json['isFav'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['resId'] = this.resId;
    data['qty'] = this.qty;
    data['rating'] = this.rating;
    data['code'] = this.code;
    data['isOpen'] = this.isOpen;
    data['resName'] = this.resName;
    data['latLng'] = this.latLng;
    data['discountType'] = this.discountType;
    data['imageUrl'] = this.imageUrl;
    data['basedCountry'] = this.basedCountry;
    data['popularDish'] = this.popularDish;
    data['estimateTime'] = this.estimateTime;
    data['isFav'] = this.isFav;
    return data;
  }
}
