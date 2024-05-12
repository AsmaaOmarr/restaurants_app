import 'package:collection/collection.dart';

import 'product.dart';
import 'restaurant.dart';

class Product {
  Product? product;
  List<Restaurant>? restaurants;

  Product({this.product, this.restaurants});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
        restaurants: (json['restaurants'] as List<dynamic>?)
            ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'product': product?.toJson(),
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
  int get hashCode => product.hashCode ^ restaurants.hashCode;
}
