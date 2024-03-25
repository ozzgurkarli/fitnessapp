import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/models/modelworkoutmove.dart';

class DatabaseWorkoutMove
{
  var refWorkoutMove = FirebaseFirestore.instance.collection("WORKOUT-MOVE");

  void insertMove(ModelWorkoutMove move){
    refWorkoutMove.doc().set(move.toJson());
  }

  Future<List<ModelWorkoutMove>> getWorkoutMoves(int workoutId) async {
    List<ModelWorkoutMove> list = [];
    await refWorkoutMove.where("workoutId", isEqualTo: workoutId).get().then((value) {
      for (var inf in value.docs) {
        list.add(ModelWorkoutMove.fromJson(inf.data()));
      }
    });
    
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