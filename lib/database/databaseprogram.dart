import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/models/modelprogram.dart';

class DatabaseProgram
{
  var refProgram = FirebaseFirestore.instance.collection("PROGRAM");

  void insertProgram(ModelProgram program){
    refProgram.doc().set(program.toJson());
  }
}