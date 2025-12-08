import 'dart:io';

import 'review_entity.dart';

 
class ProductEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final String category;
  String? imageUrl;
  final int expiryMonths;
  final bool isOrganic;
  final bool isFeatured;
  final int numOfCalories;
  final num ratingCount = 0;
  final num averageRating = 0;
  final int stockQuantity;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.category,
    this.imageUrl,
    this.isOrganic = false,
    required this.reviews,
    required this.expiryMonths,
    required this.numOfCalories,
    required this.isFeatured,
    required this.stockQuantity,
  });
}
