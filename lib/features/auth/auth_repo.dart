import 'package:dartz/dartz.dart';
import 'package:mobile_assignment_1/core/models/user.dart';
import 'package:mobile_assignment_1/core/utils/api.dart';

class AuthRepo {
  APiService apiService = APiService();

  Future<Either<String, String>> signUp({required User user}) async {
    try {
      var result = await apiService.signUp(data: user.toJson());
      print("result of sign up: $result");

      if (result.statusCode == 201) {
        print("success+++++++++");
        return right("singup successfully");
      } else if (result.statusCode == 422) {
        print("Failed+++++++++");
        print(result.statusCode);
        return left(result.data['message']);
      } else {
        return left("error try again Later");
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> signIn(
      {required String email, required String password}) async {
    try {
      var result =
          await apiService.signIn(data: {"email": email, "password": password});
      print("result of sign in: $result");
      if (result.statusCode == 200) {
        print("success+++++++++");
        return right("Sign In Successfully");
      } else if (result.statusCode == 401) {
        print("Failed+++++++++");
        return left(result.data['message']);
      } else {
        print("Failed+++++++++");
        return left("error try again Later");
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
