import 'package:dartz/dartz.dart';

import '../../entities/CategoryOrBrandResponseEntity.dart';
import '../../entities/failures.dart';

abstract class HomeTabRemoteDatasource{
  Future <Either<Failures, CategoryOrBrandResponseEntity>>getAllCategories();
Future <Either<Failures, CategoryOrBrandResponseEntity>>getBrands();


}