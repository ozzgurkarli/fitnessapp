import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/constants/pool.dart';
import 'package:fitnessapp/common/models/modelworkout.dart';
import 'package:http/http.dart' as http;

class DatabaseWorkout {
  var refWorkout = FirebaseFirestore.instance.collection("WORKOUT");

  void insertExercise(ModelWorkout exercise) {
    refWorkout.doc().set(exercise.toJson());
  }

  Future<http.Response> insertWorkoutByProgramId(int programId)async{

    final uri = Uri.parse('${Pool.connectionString}/Workout/CreateByProgramId?id=$programId');
    late http.Response response;

    try{
      response = await http.post(uri, headers: <String, String>{
        'Content-type':'application/json; charset=UTF-8'
      });
    }
    catch(e){
      return response;
    }

    return response;
  }

  Future<http.Response?> getWorkoutLast12Hour(int userId)async{
    if(Pool.workoutSearched){
      return null;
    }

    final uri = Uri.parse('${Pool.connectionString}/Workout/GetWorkoutInLast12Hour?id=$userId');
    late http.Response response;

    try{
      response = await http.get(uri, headers: <String, String>{
        'Content-type':'application/json; charset=UTF-8'
      });
    }
    catch(e){
      return response;
    }

    Pool.workoutSearched = true;
    return response;
  }

  Future<List<ModelWorkout>> getWorkoutsAll(int userId) async {
    List<ModelWorkout> list = [];
    await refWorkout.where("userId", isEqualTo: userId).get().then((value) {
      for (var inf in value.docs) {
        list.add(ModelWorkout.fromJson(inf.data()));
      }
    });
    
    return list;
  }

  Future<bool> deleteWorkout(int workoutId)async{
    return await refWorkout.where("workoutId", isEqualTo: workoutId).get().then((value) {
      for (var inf in value.docs) {
        refWorkout.doc(inf.id).delete();
      }
      return true;
    });
  }
}
