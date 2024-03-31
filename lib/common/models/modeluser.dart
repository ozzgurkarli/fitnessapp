import 'package:cloud_firestore/cloud_firestore.dart';

class ModelUser
{
  int? id;
  String? name;
  String? surname;
  String? email;
  String? birthDate;
  int? gender;
  String? invitationCode;

  ModelUser(this.id, this.name, this.surname, this.email, this.birthDate, this.gender, this.invitationCode): super();
  ModelUser.empty();

  factory ModelUser.fromJson(Map<dynamic, dynamic> json) {
    return ModelUser(
        json["id"] as int,
        json["name"] as String,
        json["surname"] as String,
        json["email"] as String,
        json["birthDate"] as String,
        json["gender"] as int,
        json["invitationCode"] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surname": surname,
      "email": email,
      "birthDate": birthDate,
      "gender": gender,
      "invitationCode": invitationCode
    };
  }

}