import 'package:e_commerce_app/domain/entities/UserEntity.dart';



class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.user, 
      this.token,});


  String? message;
  UserEntity? user;
  String? token;


}