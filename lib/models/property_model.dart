import 'property_sub_group_models.dart';

class PropertyModel {
  final String propertyType;
  final int id;
  final int ownerId;
  final int listedUserId;
  final Address address;
  final String? propertyCode;
  final String propertyName;
  final String description;
  final String status;
  final bool featured;
  final List<int> amenityIds;
  final List<String> images;
  final double price;

  PropertyModel({
    required this.propertyType,
    required this.id,
    required this.ownerId,
    required this.listedUserId,
    required this.address,
    required this.propertyCode,
    required this.propertyName,
    required this.description,
    required this.status,
    required this.featured,
    required this.amenityIds,
    required this.images,
    required this.price,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      propertyType: json['propertyType'],
      id: json['id'],
      ownerId: json['ownerId'],
      listedUserId: json['listedUserId'],
      address: Address.fromJson(json['address']),
      propertyCode: json['propertyCode'] ? json['propertyCode'] : '',
      propertyName: json['propertyName'],
      description: json['description'],
      status: json['status'],
      featured: json['featured'],
      amenityIds: List<int>.from(json['amenityIds']),
      images: List<String>.from(json['images']),
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'propertyType': propertyType,
      'id': id,
      'ownerId': ownerId,
      'listedUserId': listedUserId,
      'address': address.toJson(),
      'propertyCode': propertyCode,
      'propertyName': propertyName,
      'description': description,
      'status': status,
      'featured': featured,
      'amenityIds': amenityIds,
      'images': images,
      'price': price,
    };
  }
}

class Address {
  final String street;
  final String city;
  final String region;
  final String country;
  final String postalCode;
  final double latitude;
  final double longitude;

  Address({
    required this.street,
    required this.city,
    required this.region,
    required this.country,
    required this.postalCode,
    required this.latitude,
    required this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      region: json['region'],
      country: json['country'],
      postalCode: json['postalCode'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'region': region,
      'country': country,
      'postalCode': postalCode,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

List<PropertyModel> parseProperties(List<dynamic> jsonList) {
  return jsonList.map((json) {
    String propertyType = json['propertyType'];
    switch (propertyType) {
      case 'COMMERCIAL':
        return CommercialPropertyModel.fromJson(json);
      case 'INDUSTRIAL':
        return IndustrialPropertyModel.fromJson(json);
      case 'RESIDENTIAL':
        return ResidentialPropertyModel.fromJson(json);
      case 'LAND':
        return LandPropertyModel.fromJson(json);
      case 'SPECIAL_PURPOSE':
        return SpecialPurposePropertyModel.fromJson(json);
      default:
        throw Exception('Unknown property type: $propertyType');
    }
  }).toList();
}
