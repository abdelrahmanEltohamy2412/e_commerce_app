import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/ApiManger.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/repository/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSource{
  ApiManger apiManger ;
  AuthRemoteDataSourceImp({required this.apiManger});
 

  @override
  Future<Either<Failures, AuthResultEntity>> register
      (String name, String email, String password, String rePassword, String phone) async {
    var either = await apiManger.register(name, email, password, rePassword, phone);
    return either.fold((l) {
          return Left(l);
        }, (r) {
          return Right(r.toAuthResultEntity());
        });
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(String email, String password) async{
    var either =await apiManger.login(email, password);
    return either.fold(
            (l){
                   return Left(l);
            }
        ,
            (r){
                return Right(r.toAuthResultEntity());
            });
  }



}