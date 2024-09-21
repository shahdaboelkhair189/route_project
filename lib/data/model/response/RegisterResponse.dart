/// message : "success"
/// user : {"name":"Shahd","email":"shahdaboelkhair@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZWNiZTFjOTQ1ZTAxN2Q2ZTVmN2QyMyIsIm5hbWUiOiJTaGFoZCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI2NzkxMTk3LCJleHAiOjE3MzQ1NjcxOTd9.8EDuu1O5SvNh3XsRzqEneR6GwiFcN_CXrky0g2pMEX4"

class RegisterResponse {
  RegisterResponse({
    this.message,
    this.user,
    this.statusMsg,
    this.token,
  });

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['message'];

    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  User? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
}

/// name : "Shahd"
/// email : "shahdaboelkhair@gmail.com"
/// role : "user"

class User {
  User({
    this.name,
    this.email,
    this.role,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}
