import 'package:mobile_assignment_1/core/models/user.dart';
import 'package:mobile_assignment_1/core/utils/api.dart';

class AuthRepo {
  APiService apiService = APiService();

  Future<void> signUp({required User user}) async {
    try {
      var result = await apiService.signUp(data: user.toJson());
      print("result of sign up: $result");

      if (result.statusCode == 200) {
        print("success+++++++++");
      } else {
        print("Failed+++++++++");
      }
    } catch (e) {}
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      var result =
          await apiService.signIn(data: {"email": email, "password": password});
      print("result of sign in: $result");
      if (result.statusCode == 200) {
        print("success+++++++++");
      } else {
        print("Failed+++++++++");
      }
    } catch (e) {}
  }
}
