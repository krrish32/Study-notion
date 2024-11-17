class LoginResponseModel {
  LoginResponseModel({
    required this.success,
    required this.token,
    required this.user,
    required this.message,
  });

  final bool? success;
  final String? token;
  final User? user;
  final String? message;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json){
    return LoginResponseModel(
      success: json["success"],
      token: json["token"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "token": token,
    "user": user?.toJson(),
    "message": message,
  };

}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.accountType,
    required this.active,
    required this.approved,
    required this.additionalDetails,
    required this.courses,
    required this.image,
    required this.courseProgress,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.token,
  });

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? accountType;
  final bool? active;
  final bool? approved;
  final AdditionalDetails? additionalDetails;
  final List<dynamic> courses;
  final String? image;
  final List<dynamic> courseProgress;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? token;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["_id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      accountType: json["accountType"],
      active: json["active"],
      approved: json["approved"],
      additionalDetails: json["additionalDetails"] == null ? null : AdditionalDetails.fromJson(json["additionalDetails"]),
      courses: json["courses"] == null ? [] : List<dynamic>.from(json["courses"]!.map((x) => x)),
      image: json["image"],
      courseProgress: json["courseProgress"] == null ? [] : List<dynamic>.from(json["courseProgress"]!.map((x) => x)),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "accountType": accountType,
    "active": active,
    "approved": approved,
    "additionalDetails": additionalDetails?.toJson(),
    "courses": courses.map((x) => x).toList(),
    "image": image,
    "courseProgress": courseProgress.map((x) => x).toList(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "token": token,
  };

}

class AdditionalDetails {
  AdditionalDetails({
    required this.id,
    required this.gender,
    required this.dateOfBirth,
    required this.about,
    required this.contactNumber,
    required this.v,
  });

  final String? id;
  final dynamic gender;
  final dynamic dateOfBirth;
  final dynamic about;
  final dynamic contactNumber;
  final int? v;

  factory AdditionalDetails.fromJson(Map<String, dynamic> json){
    return AdditionalDetails(
      id: json["_id"],
      gender: json["gender"],
      dateOfBirth: json["dateOfBirth"],
      about: json["about"],
      contactNumber: json["contactNumber"],
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "gender": gender,
    "dateOfBirth": dateOfBirth,
    "about": about,
    "contactNumber": contactNumber,
    "__v": v,
  };

}
