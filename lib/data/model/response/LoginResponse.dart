/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti11@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MWZhMzUzMWVkM2UzNGFhYjU4NGI4NSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI2ODUxODAyLCJleHAiOjE3MzQ2Mjc4MDJ9.u7mrQ9gDIwPo_Dcvl0vPEkItNfeebQqNCyYZq5PnPBA"

class LoginResponse {
  LoginResponse({
    this.message,
    this.user,
    this.token,
  });

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  String? statusMsg;

  User? user;
  String? token;

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

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti11@gmail.com"
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
