import 'package:cloud_firestore/cloud_firestore.dart';

class ModelProgram
{
  int userId;
  int programId;
  String programName;
  Timestamp recordDate;

  ModelProgram(this.userId, this.programId, this.programName, this.recordDate);

  factory ModelProgram.fromJson(Map<dynamic, dynamic> json) {
    return ModelProgram(
        json["userId"] as int,
        json["programId"] as int,
        json["programName"] as String,
        json["recordDate"] as Timestamp);
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "programId": programId,
      "programName": programName,
      "recordDate": recordDate
    };
  }
}