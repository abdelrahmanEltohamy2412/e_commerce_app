import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/GetCardRsponseEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';

abstract class CartRepository{
 Future<Either<Failures,GetCardResponseEntity>> getCart();


}