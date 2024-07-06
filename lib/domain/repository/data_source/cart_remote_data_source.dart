import 'package:dartz/dartz.dart';

import '../../entities/GetCardRsponseEntity.dart';
import '../../entities/failures.dart';

abstract class CartRemoteDataSource{
  Future<Either<Failures,GetCardResponseEntity>> getCart();
  Future<Either<Failures,GetCardResponseEntity>> deleteItemInCart(String productId);
  Future<Either<Failures,GetCardResponseEntity>> updateCountInCart(int count,String productId);


}
