import 'package:collection/collection.dart';
import 'package:mobile_assignment_1/core/models/all_resutrant_model/restaurant.dart';

class Product {
  int? id;
  String? productName;
  String? description;
  String? price;
  String? imageUrl;
  List<Restaurant>? restaurants;

  Product({
    this.id,
    this.productName,
    this.description,
    this.price,
    this.imageUrl,
    this.restaurants,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int?,
        productName: json['product_name'] as String?,
        description: json['description'] as String?,
        price: json['price'] as String?,
        imageUrl: json['image_url'] as String?,
        restaurants: (json['restaurants'] as List<dynamic>?)
            ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_name': productName,
        'description': description,
        'price': price,
        'image_url': imageUrl,
        'restaurants': restaurants?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Product) return false;
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
      restaurants.hashCode;
}
