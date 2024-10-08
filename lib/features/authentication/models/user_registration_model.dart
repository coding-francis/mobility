class UserRegistrationModel {
  String firstName;
  String? middleName;
  String? phoneNumber;
  String lastName;
  String emailAddress;
  String password;
  String role;
  String country;
  String state;
  String city;
  String location;

  UserRegistrationModel({
    required this.firstName,
    this.middleName,
    this.phoneNumber,
    required this.lastName,
    required this.emailAddress,
    required this.password,
    required this.role,
    required this.country,
    required this.state,
    required this.city,
    required this.location,
  });

  factory UserRegistrationModel.fromJson(Map<String, dynamic> json) {
    return UserRegistrationModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      middleName: json['middleName'],
      phoneNumber: json['phoneNumber'],
      emailAddress: json['emailAddress'],
      password: json['password'],
      role: json['role'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'middleName': middleName,
      'phoneNumber': phoneNumber,
      'lastName': lastName,
      'emailAddress': emailAddress,
      'password': password,
      'role': role,
      'country': country,
      'state': state,
      'city': city,
      'location': location,
    };
  }
}
