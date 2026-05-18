class CategoryModel {
  bool? _success;
  String? _message;
  List<CategoryData>? _data;

  CategoryModel({bool? success, String? message, List<CategoryData>? data}) {
    if (success != null) {
      this._success = success;
    }
    if (message != null) {
      this._message = message;
    }
    if (data != null) {
      this._data = data;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get message => _message;
  set message(String? message) => _message = message;
  List<CategoryData>? get data => _data;
  set data(List<CategoryData>? data) => _data = data;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <CategoryData>[];
      json['data'].forEach((v) {
        _data!.add(new CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryData {
  int? _cateId;
  String? _name;
  String? _slug;
  String? _description;
  String? _imageUrl;
  int? _priority;
  bool? _status;
  String? _createdAt;
  String? _updatedAt;

  CategoryData({
    int? cateId,
    String? name,
    String? slug,
    String? description,
    String? imageUrl,
    int? priority,
    bool? status,
    String? createdAt,
    String? updatedAt,
  }) {
    if (cateId != null) {
      this._cateId = cateId;
    }
    if (name != null) {
      this._name = name;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (description != null) {
      this._description = description;
    }
    if (imageUrl != null) {
      this._imageUrl = imageUrl;
    }
    if (priority != null) {
      this._priority = priority;
    }
    if (status != null) {
      this._status = status;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get cateId => _cateId;
  set cateId(int? cateId) => _cateId = cateId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;
  int? get priority => _priority;
  set priority(int? priority) => _priority = priority;
  bool? get status => _status;
  set status(bool? status) => _status = status;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  CategoryData.fromJson(Map<String, dynamic> json) {
    _cateId = json['cateId'];
    _name = json['name'];
    _slug = json['slug'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
    _priority = json['priority'];
    _status = json['status'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cateId'] = this._cateId;
    data['name'] = this._name;
    data['slug'] = this._slug;
    data['description'] = this._description;
    data['imageUrl'] = this._imageUrl;
    data['priority'] = this._priority;
    data['status'] = this._status;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    return data;
  }
}
