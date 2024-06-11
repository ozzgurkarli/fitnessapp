import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/constants/pool.dart';
import 'package:fitnessapp/common/models/modelworkoutmove.dart';
import 'package:http/http.dart' as http;

class DatabaseWorkoutMove
{
  var refWorkoutMove = FirebaseFirestore.instance.collection("WORKOUT-MOVE");

  Future<http.Response> updateWorkoutMove(ModelWorkoutMove move)async{

    final uri = Uri.parse('${Pool.connectionString}/WorkoutMove/UpdateWorkoutMove');
    late http.Response response;

    try{
      response = await http.put(uri, headers: <String, String>{
        'Content-type':'application/json; charset=UTF-8'
      },body: json.encode(move.toJson()));
    }
    catch(e){
      return response;
    }

    return response;
  }
  Future<List<ModelWorkoutMove>> emptyMethod() async {
    List<ModelWorkoutMove> list = [];
    
    return list;
  }

  void deleteWorkoutMoves(int workoutId)async{
    refWorkoutMove.where("workoutId", isEqualTo: workoutId).get().then((value) {
      for (var inf in value.docs) {
        refWorkoutMove.doc(inf.id).delete();
      }
    });
  }
}