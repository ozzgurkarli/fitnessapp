import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/models/modelprogram.dart';

class DatabaseProgram
{
  var refProgram = FirebaseFirestore.instance.collection("PROGRAM");

  void insertProgram(ModelProgram program){
    refProgram.doc().set(program.toJson());
  }

  Future<List<ModelProgram>> getProgramsById(int userId)async{
    List<ModelProgram> list = [];
    await refProgram.where("userId", isEqualTo: userId).get().then((value){
      for(var inf in value.docs){
        list.add(ModelProgram.fromJson(inf.data()));
      }
    });

    return list;
  }
}