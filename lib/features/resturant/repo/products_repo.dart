import 'dart:convert';

import 'package:mobile_assignment_1/core/models/products_model/products_model.dart';
import 'package:mobile_assignment_1/core/utils/api.dart';

class ProductsReo {
  APiService apiService = APiService();
  Future<List<ProductsModel>> getProducts({required String name}) async {
    try {
      var result = await apiService.getProducts(name: name);
      if (result.statusCode == 200) {
        List<dynamic> data = result.data as List<dynamic>;
        List<ProductsModel> products =
            data.map((json) => ProductsModel.fromJson(json)).toList();
        return products;
      } else {
        throw Exception('Failed to fetch product data: ${result.statusCode}');
      }
    } catch (e) {
      print('Error fetching product data: $e');
      throw Exception('Failed to fetch product data: $e');
    }
  }
}
