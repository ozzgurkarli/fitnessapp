import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/models/modelmove.dart';
import 'package:fitnessapp/common/models/modelprogrammove.dart';

class DatabaseMove {
  var refMove = FirebaseFirestore.instance.collection("MOVES");

  Future<List<ModelMove>> getMovesByMuscle(String muscle) async {
    List<ModelMove> list = [];
    refMove = FirebaseFirestore.instance
        .collection("MOVES")
        .doc(muscle.toUpperCase())
        .collection(muscle.toUpperCase());

    await refMove.get().then((value) {
      if (value.docs.length > 0) {
        for (var inf in value.docs) {
          list.add(ModelMove.fromJson(inf.data()));
        }
      }
    });

    return list;
  }

  Future<int> getIdByMoveName(ModelProgramMove item, String moveName)async{
    refMove = FirebaseFirestore.instance
        .collection("MOVES")
        .doc(item.muscle!.toUpperCase())
        .collection(item.muscle!.toUpperCase());

    return await refMove.where("moveName", isEqualTo: moveName).get().then((value){
      return ModelMove.fromJson(value.docs.first.data()).moveId;
    });
  }

  Future<String> getNameByMoveId(ModelProgramMove item)async{
    refMove = FirebaseFirestore.instance
        .collection("MOVES")
        .doc(item.muscle!.toUpperCase())
        .collection(item.muscle!.toUpperCase());

    return await refMove.where("moveId", isEqualTo: item.moveId).get().then((value){
      return ModelMove.fromJson(value.docs.first.data()).moveName;
    });
  }
}
