import 'package:cloud_firestore/cloud_firestore.dart';

class ModelUser
{
  int? id;
  String? name;
  String? surname;
  String? email;
  double? height;
  double? kg;
  String? birthDate;
  int? gender;
  int? frequency;
  int? recordType;
  Timestamp? recordDate;

  ModelUser(this.id, this.name, this.surname, this.email, this.height, this.kg, this.birthDate, this.gender, this.frequency): super();
  ModelUser.log(this.id, this.name, this.surname, this.email, this.height, this.kg, this.birthDate, this.gender, this.frequency, this.recordType, this.recordDate): super();
  ModelUser.empty();

  factory ModelUser.fromJson(Map<dynamic, dynamic> json) {
    return ModelUser(
        json["id"] as int,
        json["name"] as String,
        json["surname"] as String,
        json["email"] as String,
        json["height"] as double,
        json["kg"] as double,
        json["birthDate"] as String,
        json["gender"] as int,
        json["frequency"] as int);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "surname": surname,
      "email": email,
      "height": height,
      "kg": kg,
      "birthDate": birthDate,
      "gender": gender,
      "frequency": frequency,
    };
  }

  factory ModelUser.logFromJson(Map<dynamic, dynamic> json) {
    return ModelUser.log(
        json["id"] as int,
        json["name"] as String,
        json["surname"] as String,
        json["email"] as String,
        json["height"] as double,
        json["kg"] as double,
        json["birthDate"] as String,
        json["gender"] as int,
        json["frequency"] as int,
        json["recordType"] as int,
        json["recordDate"] as Timestamp
        );
  }

  Map<String, dynamic> logToJson() {
    return {
      "id": id,
      "name": name,
      "surname": surname,
      "email": email,
      "height": height,
      "kg": kg,
      "birthDate": birthDate,
      "gender": gender,
      "frequency": frequency,
      "recordType": recordType,
      "recordDate": recordDate
    };
  }
}