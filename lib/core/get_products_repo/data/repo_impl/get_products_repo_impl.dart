 
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/services/firebase_services/database_service.dart';
import 'package:fruit_hub/core/utils/failure.dart';
import 'package:fruit_hub/core/get_products_repo/data/model/product_model.dart';
import 'package:fruit_hub/core/get_products_repo/domain/entity/product_entity.dart';
import 'package:fruit_hub/core/get_products_repo/domain/repo/get_products_repo.dart';

class GetProductsRepoImpl extends GetProductsRepo {
  final DatabaseService databaseService;
  GetProductsRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      log("Fetching products 1");
      var data = await databaseService.getData(path: 'products')
          as List<Map<String, dynamic>>;
                log("Fetching products 1");
      log("Fetching products 2");

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
                log("Fetching products 3");

      return Right(products);
    } catch (e) {
      return Left(ServerFailure("Failed to fetch products in repo impl"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSelling() async {
    try {
      log("Fetching best selling products 1");
      var data = await databaseService.getData(path: 'products', query: {
        "limit": 10,
        "orderBy": "sellingCount",
        "descending": true
      }) as List<Map<String, dynamic>>;
      log("Fetching best selling products 2");
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      log("Fetching best selling products 3");
      return Right(products);
    } catch (e) {
      return Left(ServerFailure("Failed to fetch products"));
    }
  }
}
