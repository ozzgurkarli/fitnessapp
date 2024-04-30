
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/constants/pool.dart';
import 'package:fitnessapp/common/models/modelmove.dart';
import 'package:fitnessapp/common/models/modelprogrammove.dart';
import 'package:http/http.dart' as http;

class DatabaseMove {

  Future<http.Response> getMovesByMuscle(String muscle)async{
    final uri = Uri.parse("${Pool.connectionString}/Move/GetMovesByMuscle");
    late http.Response response;

    try{
      response = await http.post(uri, headers: <String, String>{
        'Content-type':'application/json; charset=UTF-8'
      }, body: json.encode(ModelMove(0, "", muscle).toJson()));
    }
    catch(e){
      return response;
    }

    return response;
  }


  var refMove = FirebaseFirestore.instance.collection("MOVES");

  
  Future<int> getIdByMoveName(ModelProgramMove item, String moveName)async{
    refMove = FirebaseFirestore.instance
        .collection("MOVES")
        .doc(item.muscle!.toUpperCase())
        .collection(item.muscle!.toUpperCase());

    return await refMove.where("moveName", isEqualTo: moveName).get().then((value){
      return ModelMove.fromJson(value.docs.first.data()).id;
    });
  }
}
