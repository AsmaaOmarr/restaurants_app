import 'package:collection/collection.dart';

class ProductsModel {
  int? id;
  String? productName;
  String? description;
  String? price;
  String? imageUrl;
  dynamic createdAt;
  dynamic updatedAt;

  ProductsModel({
    this.id,
    this.productName,
    this.description,
    this.price,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json['id'] as int?,
        productName: json['product_name'] as String?,
        description: json['description'] as String?,
        price: json['price'] as String?,
        imageUrl: json['image_url'] as String?,
        createdAt: json['created_at'] as dynamic,
        updatedAt: json['updated_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_name': productName,
        'description': description,
        'price': price,
        'image_url': imageUrl,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ProductsModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      productName.hashCode ^
      description.hashCode ^
      price.hashCode ^
      imageUrl.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
