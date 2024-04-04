import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/models/modelprogrammove.dart';

class ModelProgram
{
  int userId;
  int programId;
  String programName;
  List? moves;

  ModelProgram(this.userId, this.programId, this.programName, {this.moves});

  factory ModelProgram.fromJson(Map<dynamic, dynamic> json) {
    return ModelProgram(
        json["userId"] as int,
        json["programId"] as int,
        json["programName"] as String,
        moves: json["programName"] as List);
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "programId": programId,
      "programName": programName,
      "moves": moves
    };
  }
}