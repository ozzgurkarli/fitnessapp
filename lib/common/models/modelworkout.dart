import 'package:cloud_firestore/cloud_firestore.dart';

class ModelWorkout {
  int exerciseId;
  int userId;
  int programId;
  String programName;
  Timestamp recordDate;
  bool completed;
  int? duration;

  ModelWorkout(this.exerciseId, this.userId, this.programId, this.programName, this.recordDate,
      this.completed,
      {this.duration});

  factory ModelWorkout.fromJson(Map<dynamic, dynamic> json) {
    var ex = ModelWorkout(
        json["exerciseId"] as int,
        json["userId"] as int,
        json["programId"] as int,
        json["programName"] as String,
        json["recordDate"] as Timestamp,
        json["completed"] as bool);

    if(ex.completed){
      ex.duration = json["duration"] as int;
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
      "duration": duration ?? 0
    };
  }
}
