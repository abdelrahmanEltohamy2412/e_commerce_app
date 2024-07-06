import 'package:dartz/dartz.dart';

import '../../entities/GetCardRsponseEntity.dart';
import '../../entities/failures.dart';

abstract class CartRemoteDataSource{
  Future<Either<Failures,GetCardResponseEntity>> getCart();

}
