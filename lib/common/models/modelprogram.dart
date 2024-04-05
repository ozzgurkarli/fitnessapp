import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/models/modelprogrammove.dart';

class ModelProgram
{
  int id;
  int userId;
  String programName;
  List? programMoves;
  DateTime? recordDate;

  ModelProgram( this.id, this.userId, this.programName,{this.programMoves, this.recordDate});

  factory ModelProgram.fromJson(Map<dynamic, dynamic> json) {
    return ModelProgram(
        json["id"] as int,
        json["userId"] as int,
        json["programName"] as String,
        recordDate: DateTime.tryParse(json["recordDate"] as String),
        programMoves: json["programMoves"] as List);
  }

  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "userId": userId,
      "programName": programName,
      "programMoves": programMoves
    };
  }
}