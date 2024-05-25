import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/models/modelworkoutmove.dart';

class DatabaseWorkoutMove
{
  var refWorkoutMove = FirebaseFirestore.instance.collection("WORKOUT-MOVE");
  
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