class LoginModel {
  final int? status;
  final String? message;
  final Data? data;

  LoginModel({
    this.status,
    this.message,
    this.data,
  });

  LoginModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data?.toJson()};
}

class Data {
  final int? id;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? countryCode;
  final String? mobile;
  final String? profileImage;
  final String? token;

  Data({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.mobile,
    this.profileImage,
    this.token,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        firstName = json['first_name'] as String?,
        lastName = json['last_name'] as String?,
        email = json['email'] as String?,
        countryCode = json['country_code'] as String?,
        mobile = json['mobile'] as String?,
        profileImage = json['profile_image'] as String?,
        token = json['token'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'country_code': countryCode,
        'mobile': mobile,
        'profile_image': profileImage,
        'token': token
      };
}
