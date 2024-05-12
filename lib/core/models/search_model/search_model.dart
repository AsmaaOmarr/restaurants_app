import 'package:collection/collection.dart';

import 'product.dart';

class SearchModel {
  String? message;
  List<Product>? products;

  SearchModel({this.message, this.products});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        message: json['message'] as String?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'products': products?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SearchModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => message.hashCode ^ products.hashCode;
}
