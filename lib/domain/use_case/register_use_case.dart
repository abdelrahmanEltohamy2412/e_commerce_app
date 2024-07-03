import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repo.dart';

import '../entities/AuthResultEntity.dart';
import '../entities/failures.dart';

class RegisterUseCase {
  AuthRepository authRepository ;
  RegisterUseCase({required this.authRepository});


  Future<Either<Failures ,AuthResultEntity>>
  invoke(String name , String email, String password,String rePassword, String phone){

    return authRepository.register(name, email, password, rePassword, phone);

  }
}