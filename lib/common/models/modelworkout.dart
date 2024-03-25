import 'package:cloud_firestore/cloud_firestore.dart';

class ModelWorkout {
  int workoutId;
  int userId;
  int programId;
  String programName;
  Timestamp recordDate;
  bool completed;
  int? duration;

  ModelWorkout(this.workoutId, this.userId, this.programId, this.programName, this.recordDate,
      this.completed,
      {this.duration});

  factory ModelWorkout.fromJson(Map<dynamic, dynamic> json) {
    var ex = ModelWorkout(
        json["workoutId"] as int,
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
      "workoutId": workoutId,
      "userId": userId,
      "programId": programId,
      "programName": programName,
      "recordDate": recordDate,
      "completed": completed,
      "duration": duration ?? 0
    };
  }
}
