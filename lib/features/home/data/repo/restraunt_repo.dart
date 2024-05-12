import 'package:mobile_assignment_1/core/models/all_resutrant_model/all_resutrant_model.dart';
import 'package:mobile_assignment_1/core/utils/api.dart';

class RepoRestaurant {
  APiService apiService = APiService();
  Future<AllResutrantModel> getRestaurantList() async {
    try {
      print('Fetching restaurant list...');

      var result = await apiService.getResuturants();
      print('Fetching restaurant list...');
      print(result);
      if (result.statusCode != 200) {
        throw Exception('Failed to fetch restaurant data==================');
      } else {
        print("success==================================");
      }
      var restaurants = AllResutrantModel.fromJson(result.data);
      print(result);
      return restaurants;
    } catch (e) {
      // Handle errors
      throw Exception('Failed to fetch restaurant data: $e');
    }
  }
}
