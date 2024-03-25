import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/models/modelprogrammove.dart';

class DatabaseProgramMove
{
  var refProgramMove = FirebaseFirestore.instance.collection("PROGRAM-MOVE");

  void insertMove(ModelProgramMove move){
    refProgramMove.doc().set(move.toJson());
  }

  Future<List<ModelProgramMove>> getProgramMoves(int programId)async{
    List<ModelProgramMove> list = [];
    await refProgramMove.where("programId", isEqualTo: programId).get().then((value){
      for(var item in value.docs){
        list.add(ModelProgramMove.fromJson(item.data()));
      }
    });

    return list;
  }
}