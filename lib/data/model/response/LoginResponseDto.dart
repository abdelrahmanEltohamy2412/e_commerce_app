
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';

import 'UserDto.dart';

class LoginResponseDto {
  LoginResponseDto({
      this.message, 
      this.user, 
      this.token,
  this.statusMsg});

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];

  }

  UserDto? user;
  String? token;
  String? message;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(
      userEntity: user?.toUserEntity() ,
      token: token
    );
  }

}