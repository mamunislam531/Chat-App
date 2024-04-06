
class UserModels {
  String? name;
  String? id;
  String? email;
  String? phone;
  String? password;
  String? token;

  UserModels({
    required this.name,
    required this.id,
    required this.email,
    required this.phone,
    required this.token,
    required this.password,
  });

  UserModels.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    token = json['token'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    map['token'] = token;
    return map;
  }
}
