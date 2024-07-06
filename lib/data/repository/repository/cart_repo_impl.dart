import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/GetCardRsponseEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/repository/data_source/cart_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/cart_repository.dart';

class CartRepoImpl implements CartRepository{
  CartRemoteDataSource cartRemoteDataSource;
  CartRepoImpl({required this.cartRemoteDataSource});
  @override
  Future<Either<Failures, GetCardResponseEntity>> getCart() {
    return cartRemoteDataSource.getCart();
  }
}