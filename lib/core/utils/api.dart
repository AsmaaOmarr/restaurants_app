import 'package:dio/dio.dart';

class APiService {
  static const String baseUrl = 'http://10.0.2.2:8000/api/';
  final dio = Dio();

  Future<Response> getResuturants() async {
    try {
      print("in api service");
      Response response = await dio.get(
        'http://10.0.2.2:8000/api/get/restaurants',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
        }),
      );

      if (response.statusCode == 200) {
        print("success+++++++++");
      } else {
        print("Failed+++++++++");
        print(response.statusCode);
      }
      print(response.data.toString());
      return response;
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }

  Future<Response> getProducts({required String name}) async {
    try {
      Response response = await dio.post(
        'http://10.0.2.2:8000/api/get/products/in/each/restaurant',
        data: {"restaurant": name},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': '*/*',
          },
        ),
      );

      if (response.statusCode == 200) {
        print("success+++++++++");
      } else {
        print("Failed+++++++++");
        print(response.statusCode);
      }
      print(response.data.toString());
      return response;
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }

  Future<Response> signUp({required Map<String, dynamic> data}) async {
    try {
      print("data: $data");
      Response response = await dio.post(
        'http://10.0.2.2:8000/api/signUp',
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': '*/*',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );

      if (response.statusCode == 201) {
        print("success+++++++++");
      } else {
        print("Failed+++++++++");
        print(response.statusCode);
      }
      print(response);
      return response;
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }

  Future<Response> signIn({required Map<String, dynamic> data}) async {
    try {
      Response response = await dio.post(
        'http://10.0.2.2:8000/api/signin',
        data: data,
        options: Options(
          validateStatus: (status) {
            return status! < 500;
          },
          headers: {
            'Content-Type': 'application/json',
            'Accept': '*/*',
          },
        ),
      );

      if (response.statusCode == 200) {
        print("success+++++++++");
      } else {
        print("Failed+++++++++");
        print(response.statusCode);
      }
      print(response.data.toString());
      return response;
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }
}
