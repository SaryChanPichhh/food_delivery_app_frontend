class CartModel {
  bool? success;
  String? message;
  List<CartData>? data;

  CartModel({this.success, this.message, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CartData>[];
      json['data'].forEach((v) {
        data!.add(CartData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartData {
  int? resId;
  String? resName;
  String? resImage;
  String? resDesc;
  bool? isOpen;
  String? address;
  String? avgEstimateTime;
  double? subTotal;
  double? totalDiscount;
  double? totalAfterDiscount;
  List<CartItem>? items;

  CartData({
    this.resId,
    this.resName,
    this.resImage,
    this.resDesc,
    this.isOpen,
    this.address,
    this.avgEstimateTime,
    this.subTotal,
    this.totalDiscount,
    this.totalAfterDiscount,
    this.items,
  });

  CartData.fromJson(Map<String, dynamic> json) {
    resId = json['resId'];
    resName = json['resName'];
    resImage = json['resImage'];
    resDesc = json['resDesc'];
    isOpen = json['isOpen'];
    address = json['address'];
    avgEstimateTime = json['avgEstimateTime'];
    subTotal = json['subTotal'] != null ? (json['subTotal'] as num).toDouble() : null;
    totalDiscount = json['totalDiscount'] != null ? (json['totalDiscount'] as num).toDouble() : null;
    totalAfterDiscount = json['totalAfterDiscount'] != null ? (json['totalAfterDiscount'] as num).toDouble() : null;
    if (json['items'] != null) {
      items = <CartItem>[];
      json['items'].forEach((v) {
        items!.add(CartItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resId'] = resId;
    data['resName'] = resName;
    data['resImage'] = resImage;
    data['resDesc'] = resDesc;
    data['isOpen'] = isOpen;
    data['address'] = address;
    data['avgEstimateTime'] = avgEstimateTime;
    data['subTotal'] = subTotal;
    data['totalDiscount'] = totalDiscount;
    data['totalAfterDiscount'] = totalAfterDiscount;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItem {
  int? headerId;
  int? detailId;
  String? itemCode;
  String? menuDescription;
  String? menuImage;
  int? qty;
  double? salePrice;
  double? total;
  double? discountValue;
  double? savingValue;
  double? totalAfterDiscount;

  CartItem({
    this.headerId,
    this.detailId,
    this.itemCode,
    this.menuDescription,
    this.menuImage,
    this.qty,
    this.salePrice,
    this.total,
    this.discountValue,
    this.savingValue,
    this.totalAfterDiscount,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    headerId = json['headerId'];
    detailId = json['detailId'];
    itemCode = json['itemCode'];
    menuDescription = json['menuDescription'];
    menuImage = json['menuImage'];
    qty = json['qty'];
    salePrice = json['salePrice'] != null ? (json['salePrice'] as num).toDouble() : null;
    total = json['total'] != null ? (json['total'] as num).toDouble() : null;
    discountValue = json['discountValue'] != null ? (json['discountValue'] as num).toDouble() : null;
    savingValue = json['savingValue'] != null ? (json['savingValue'] as num).toDouble() : null;
    totalAfterDiscount = json['totalAfterDiscount'] != null ? (json['totalAfterDiscount'] as num).toDouble() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['headerId'] = headerId;
    data['detailId'] = detailId;
    data['itemCode'] = itemCode;
    data['menuDescription'] = menuDescription;
    data['menuImage'] = menuImage;
    data['qty'] = qty;
    data['salePrice'] = salePrice;
    data['total'] = total;
    data['discountValue'] = discountValue;
    data['savingValue'] = savingValue;
    data['totalAfterDiscount'] = totalAfterDiscount;
    return data;
  }
}
