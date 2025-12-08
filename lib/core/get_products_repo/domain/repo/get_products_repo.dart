import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/utils/failure.dart';

import '../entity/product_entity.dart';

abstract class GetProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSelling();
}
