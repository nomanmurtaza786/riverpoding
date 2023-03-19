import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  List<Product> products;
  int total;
  int skip;
  int limit;

  ProductModel(this.products, this.total, this.skip, this.limit);

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class Product {
  int id;
  String title;
  String description;
  double price;
  @JsonKey(name: 'discountPercentage')
  double discount;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  Product(
    this.id,
    this.title,
    this.description,
    this.price,
    this.discount,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
