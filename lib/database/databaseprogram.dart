import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/constants/pool.dart';
import 'package:fitnessapp/common/models/modelprogram.dart';
import 'package:http/http.dart' as http;

class DatabaseProgram
{
  var refProgram = FirebaseFirestore.instance.collection("PROGRAM");

  Future<http.Response> insertProgram(ModelProgram program)async{

    final uri = Uri.parse("${Pool.connectionString}/Program/Create");
    late http.Response response;
    var xxx = program.toJson();
    String encodedjs = json.encode(xxx);
    String encoded = json.encode(program.toJson());
    try{
      response = await http.post(uri, headers: <String, String>{
        'Content-type':'application/json; charset=UTF-8'
      },body: json.encode(program));
    }
    catch(e){
      return response;
    }

    return response;
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