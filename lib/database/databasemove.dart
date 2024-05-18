
import 'dart:convert';

import 'package:fitnessapp/common/constants/pool.dart';
import 'package:fitnessapp/common/models/modelmove.dart';
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

}
