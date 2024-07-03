import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repo.dart';

class LoginUseCase{
  AuthRepository authRepository ;
  LoginUseCase ({required this.authRepository});
 Future<Either<Failures,AuthResultEntity>> invoke(String email, String password ){
    return authRepository.login(email, password);
  }
}