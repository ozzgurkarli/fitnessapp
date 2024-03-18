import 'package:cloud_firestore/cloud_firestore.dart';

class ModelExercise {
  int exerciseId;
  int userId;
  int programId;
  String programName;
  Timestamp recordDate;
  bool completed;
  Timestamp? duration;

  ModelExercise(this.exerciseId, this.userId, this.programId, this.programName, this.recordDate,
      this.completed,
      {this.duration});

  factory ModelExercise.fromJson(Map<dynamic, dynamic> json) {
    var ex = ModelExercise(
        json["exerciseId"] as int,
        json["userId"] as int,
        json["programId"] as int,
        json["programName"] as String,
        json["recordDate"] as Timestamp,
        json["completed"] as bool);

    if(ex.completed){
      ex.duration = json["duration"] as Timestamp;
    }

    return ex;
  }

  Map<String, dynamic> toJson() {
    return {
      "exerciseId": exerciseId,
      "userId": userId,
      "programId": programId,
      "programName": programName,
      "recordDate": recordDate,
      "completed": completed,
      "duration": recordDate
    };
  }
}
