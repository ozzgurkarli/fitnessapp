import 'dart:convert';

import 'package:fitnessapp/common/constants/pool.dart';
import 'package:fitnessapp/common/models/modelprogram.dart';
import 'package:http/http.dart' as http;

class DatabaseProgram
{
  Future<http.Response> insertProgram(ModelProgram program)async{

    final uri = Uri.parse("${Pool.connectionString}/Program/Create");
    late http.Response response;

    try{
      response = await http.post(uri, headers: <String, String>{
        'Content-type':'application/json; charset=UTF-8'
      },body: json.encode(program.toJson()));
    }
    catch(e){
      return response;
    }

    return response;
  }

  Future<http.Response?> getProgramsByUserId(int userId)async{

    if(Pool.programsSearched){
      return null;
    }

    final uri = Uri.parse("${Pool.connectionString}/Program/GetProgramsByUserId?id=$userId");
    late http.Response response;

    try{
      response = await http.get(uri, headers: <String, String>{
        'Content-type':'application/json; charset=UTF-8'
      });
    }
    catch(e){
      return response;
    }

    Pool.programsSearched = true;
    return response;
  }
}