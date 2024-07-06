import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/ApiManger.dart';
import 'package:e_commerce_app/domain/entities/GetCardRsponseEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/repository/data_source/cart_remote_data_source.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource{
  ApiManger apiManger;
  CartRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failures, GetCardResponseEntity>> getCart()async {
   var either = await apiManger.getCart();
   return either.fold((l){
     return Left(l);
   }, (response){
     return Right(response);
   });
  }
}