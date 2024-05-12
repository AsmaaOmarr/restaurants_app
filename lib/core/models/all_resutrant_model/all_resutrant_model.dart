import 'restaurant.dart';

class AllResutrantModel {
  String? message;
  List<Restaurant>? restaurants;

  AllResutrantModel({this.message, this.restaurants});

  factory AllResutrantModel.fromJson(Map<String, dynamic> json) {
    return AllResutrantModel(
      message: json['message'] as String?,
      restaurants: (json['restaurants'] as List<dynamic>?)
          ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'restaurants': restaurants?.map((e) => e.toJson()).toList(),
      };
}
