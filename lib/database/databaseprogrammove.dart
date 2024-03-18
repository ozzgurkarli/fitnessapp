import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/models/modelprogrammove.dart';

class DatabaseProgramMove
{
  var refProgramMove = FirebaseFirestore.instance.collection("PROGRAM-MOVE");

  void insertMove(ModelProgramMove move){
    refProgramMove.doc().set(move.toJson());
  }
}