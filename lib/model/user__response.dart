class UserResponse {
  String _id;
  String _name;
  String _image;
  String _address;
  String _description;

  UserResponse(
      {String id,
      String name,
      String image,
      String address,
      String description}) {
    this._id = id;
    this._name = name;
    this._image = image;
    this._address = address;
    this._description = description;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get image => _image;
  set image(String image) => _image = image;
  String get address => _address;
  set address(String address) => _address = address;
  String get description => _description;
  set description(String description) => _description = description;

  UserResponse.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _address = json['address'];
    _description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['image'] = this._image;
    data['address'] = this._address;
    data['description'] = this._description;
    return data;
  }
}
