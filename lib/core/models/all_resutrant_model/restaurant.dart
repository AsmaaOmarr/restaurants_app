class Restaurant {
  int? id;
  String? name;
  String? address;
  String? latitude;
  String? longitude;
  String? phone;
  String? email;
  String? url;
  String? country;
  String? city;
  String? primaryCategoryName;
  String? imageUrl;
  double? starCount;
  int? ratingCount;
  dynamic createdAt;
  dynamic updatedAt;

  Restaurant({
    this.id,
    this.name,
    this.address,
    this.latitude,
    this.longitude,
    this.phone,
    this.email,
    this.url,
    this.country,
    this.city,
    this.primaryCategoryName,
    this.imageUrl,
    this.starCount,
    this.ratingCount,
    this.createdAt,
    this.updatedAt,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json['id'] as int?,
        name: json['name'] as String?,
        address: json['address'] as String?,
        latitude: json['latitude'] as String?,
        longitude: json['longitude'] as String?,
        phone: json['phone'] as String?,
        email: json['email'] as String?,
        url: json['url'] as String?,
        country: json['country'] as String?,
        city: json['city'] as String?,
        primaryCategoryName: json['primary_category_name'] as String?,
        imageUrl: json['image_url'] as String?,
        starCount: (json['star_count'] as num?)?.toDouble(),
        ratingCount: json['rating_count'] as int?,
        createdAt: json['created_at'] as dynamic,
        updatedAt: json['updated_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'phone': phone,
        'email': email,
        'url': url,
        'country': country,
        'city': city,
        'primary_category_name': primaryCategoryName,
        'image_url': imageUrl,
        'star_count': starCount,
        'rating_count': ratingCount,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
