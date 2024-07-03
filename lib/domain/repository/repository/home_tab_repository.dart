import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';

abstract class HomeTabRepository{
 Future <Either<Failures, CategoryOrBrandResponseEntity>>getAllCategories();
 Future <Either<Failures, CategoryOrBrandResponseEntity>>getAllBrands();

}