import 'package:mobile_assignment_1/core/utils/api.dart';

import '../models/search_model/search_model.dart';

class SearchRepo {
  APiService apiService = APiService();
  Future<SearchModel> searchByProduct(String productName) async {
    try {
      print('Fetching product...');

      var result = await apiService.searchByProduct(productName);
      if (result.statusCode != 200) {
        throw Exception('Failed to fetch product data==================');
      } else {
        print("success==================================");
      }
      var products = SearchModel.fromJson(result.data);
      print(result);
      return products;
    } catch (e) {
      // Handle errors
      throw Exception('Failed to fetch products data: $e');
    }
  }
}
