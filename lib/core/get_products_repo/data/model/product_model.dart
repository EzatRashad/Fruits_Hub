import 'dart:io';

import 'package:fruit_hub/core/get_products_repo/data/model/review_model.dart';
import 'package:fruit_hub/core/get_products_repo/domain/entity/review_entity.dart';

import '../../domain/entity/product_entity.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final String category;
  String? imageUrl;
  final int sellingCount;
  final int expiryMonths;
  final bool isOrganic;
  final bool isFeatured;
  final int numOfCalories;
  final num ratingCount;
  final num averageRating;
  final List<ReviewModel> reviews;

  final int stockQuantity;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.category,
    required this.isFeatured,
    this.isOrganic = false,
    this.sellingCount = 0,
    this.imageUrl,
    required this.reviews,
    required this.expiryMonths,
    required this.numOfCalories,
    required this.ratingCount,
    required this.averageRating,
    required this.stockQuantity,
  });

 factory ProductModel.fromJson(Map<String, dynamic> json) {
    // أولاً: حوّل الريفيوهات لـ entities
    List<ReviewEntity> reviewEntities = (json['reviews'] as List? ?? [])
        .map((e) => ReviewModel.fromJson(e).toEntity())
        .toList();

    return ProductModel(
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      category: json['category'] ?? '',
      isOrganic: json['isOrganic'] ?? false,
      isFeatured: json['isFeatured'] ?? false,
      imageUrl: json['imageUrl'],
      sellingCount: json['sellingCount'] ?? 0,
      reviews: reviewEntities.map((e) => ReviewModel.fromEntity(e)).toList(),
      expiryMonths: json['expiryMonths'] ?? 0,
      numOfCalories: json['numOfCalories'] ?? 0,
      ratingCount: json['ratingCount'] ?? reviewEntities.length,
      averageRating: getAvgRatingFromReviews(reviewEntities),
      stockQuantity: json['stockQuantity'] ?? 0,
    );
  }


  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      category: entity.category,
      isOrganic: entity.isOrganic,
      isFeatured: entity.isFeatured,
      imageUrl: entity.imageUrl,
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      expiryMonths: entity.expiryMonths,
      numOfCalories: entity.numOfCalories,
      ratingCount: entity.ratingCount,
      averageRating: entity.averageRating,
      stockQuantity: entity.stockQuantity,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      category: category,
      isOrganic: isOrganic,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      expiryMonths: expiryMonths,
      numOfCalories: numOfCalories,
      isFeatured: isFeatured,
      stockQuantity: stockQuantity,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'category': category,
      'sellingCount': sellingCount,
      'isFeatured': isFeatured,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'imageUrl': imageUrl,
      'expiryMonths': expiryMonths,
      'isOrganic': isOrganic,
      'numOfCalories': numOfCalories,
      'stockQuantity': stockQuantity
    };
  }
}

num getAvgRatingFromReviews(List<ReviewEntity> reviews) {
  if (reviews.isEmpty) return 0;
  num total = 0;
  for (var review in reviews) {
    total += review.ratting;
  }
  return total / reviews.length;
}
