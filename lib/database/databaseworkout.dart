import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/constants/pool.dart';
import 'package:http/http.dart' as http;

class DatabaseWorkout {
  var refWorkout = FirebaseFirestore.instance.collection("WORKOUT");

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

  Future<http.Response?> getWorkoutNotCompleted(int userId)async{
    if(Pool.workoutSearched){
      return null;
    }

    final uri = Uri.parse('${Pool.connectionString}/Workout/GetWorkoutNotCompleted?id=$userId');
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

  Future<http.Response?> getWorkoutsAll(int userId) async {

    final uri = Uri.parse('${Pool.connectionString}/Workout/GetWorkoutsByUserId?id=$userId');
    late http.Response response;

    try{
      response = await http.get(uri, headers: <String, String>{
        'Content-type':'application/json; charset=UTF-8'
      });
    }
    catch(e){
      return response;
    }
    
    return response;
  }

  Future<http.Response?> completeWorkout(int workoutId)async{
    final uri = Uri.parse('${Pool.connectionString}/Workout/CompleteWorkout?id=$workoutId');
    late http.Response response;

    try{
      response = await http.get(uri, headers: <String, String>{
        'Content-type':'application/json; charset=UTF-8'
      });
    }
    catch(e){
      return response;
    }
    
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
