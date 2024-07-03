import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';

abstract class LoginStates {}

class LoginLoadingState extends LoginStates{

}
class LoginInitialState extends LoginStates{

}
class LoginErrorState extends LoginStates{
  String ?errorMessage;
  LoginErrorState({required this.errorMessage});
}
class LoginSuccessState extends LoginStates{
  AuthResultEntity authResultEntity ;
  LoginSuccessState({
    required this.authResultEntity
  });
}



