import 'package:e_commerce_app/data/model/response/Error.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';

import 'UserDto.dart';

class RegisterResponseDto {
  RegisterResponseDto({
      this.message,
      this.user,
      this.token,
      this.errors


  });


  RegisterResponseDto.fromJson(dynamic json) {

    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
    message = json['message'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
  Errors ?errors;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthResultEntity toAuthResultEntity (){
    return AuthResultEntity(token: token,
        userEntity: user?.toUserEntity()
    );
  }
}