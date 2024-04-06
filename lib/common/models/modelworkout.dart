import 'package:cloud_firestore/cloud_firestore.dart';

class ModelWorkout {
  int id;
  int? userId;
  int? programId;
  String? programName;
  List? workoutMoves;
  DateTime? recordDate;
  bool? completed;
  int? duration;

  ModelWorkout(this.id,
      {this.userId, this.programId, this.programName,
      this.completed,this.duration, this.workoutMoves, this.recordDate,});

  factory ModelWorkout.fromJson(Map<dynamic, dynamic> json) {
    var ex = ModelWorkout(
        json["id"] as int,
        userId: json["userId"] as int,
        programId: json["programId"] as int,
        programName: json["programName"] as String,
        completed: json["completed"] as bool,
        recordDate: DateTime.tryParse(json["recordDate"] as String),
        workoutMoves: json["workoutMoves"] as List);

    if(ex.completed!){
      ex.duration = json["duration"] as int;
    }

    return ex;
  }

  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "userId": userId,
      "programId": programId,
      "programName": programName,
      "recordDate": recordDate,
      "completed": completed,
      "duration": duration ?? 0
    };
  }
}
