import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AddCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/ProducResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';

abstract class HomeRepository{
 Future <Either<Failures, CategoryOrBrandResponseEntity>>getAllCategories();
 Future <Either<Failures, CategoryOrBrandResponseEntity>>getAllBrands();
 Future <Either<Failures, ProductResponseEntity>>getAllProducts();
 Future <Either<Failures, AddCartResponseEntity>>addProducts(String productId);


}