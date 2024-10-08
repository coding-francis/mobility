class UserModel {
  int? id;
  String firstName;
  String middleName;
  String lastName;
  String role;
  String? phoneNumber;
  String emailAddress;
  List<String>? portals;
  bool isUserVerified;
  AuthenticationResponse authenticationResponse;

  UserModel({
    this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.role,
    this.phoneNumber,
    required this.emailAddress,
    this.portals,
    required this.isUserVerified,
    // required this.photo,
    required this.authenticationResponse,
  });

  factory UserModel.fromJson(Map json) {
    return UserModel(
      id: json['id'] as int?,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      role: json['role'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      emailAddress: json['emailAddress'] as String,
      isUserVerified: json['isUserVerified'] ?? false,
      // portals: json['portals'] as List<String>?,
      portals: json['portals'] != null
          ? List<String>.from(json['portals'] as List<dynamic>)
          : null,
      // photo: Photo.fromJson(json['photo'] as Map),
      authenticationResponse: AuthenticationResponse.fromJson(
        json['authenticationResponse'] as Map,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'role': role,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
      'portals': portals,
      'isUserVerified': isUserVerified,
      // 'photo': photo.toJson(),
      'authenticationResponse': authenticationResponse.toJson(),
    };
  }
}

class Photo {
  int id;
  dynamic photo;
  dynamic user;

  Photo({
    required this.id,
    required this.photo,
    required this.user,
  });

  factory Photo.fromJson(Map json) {
    return Photo(
      id: json['id'],
      photo: json['photo'],
      user: json['user'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'photo': photo,
      'user': user,
    };
  }
}

class AuthenticationResponse {
  String token;

  AuthenticationResponse({
    required this.token,
  });

  factory AuthenticationResponse.fromJson(Map json) {
    return AuthenticationResponse(
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
