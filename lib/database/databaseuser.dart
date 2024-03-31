import 'dart:convert';

import 'package:fitnessapp/common/constants/pool.dart';
import 'package:fitnessapp/common/models/modeluser.dart';
import 'package:http/http.dart' as http;

class DatabaseUser
{

  Future<http.Response> insertUser(ModelUser user)async{

    final uri = Uri.parse("${Pool.connectionString}/User/Create");
    late http.Response response;

    try{
      response = await http.post(uri, headers: <String, String>{
        'Content-type':'application/json; charset=UTF-8'
      },body: json.encode(user));
    }
    catch(e){
      return response;
    }

    return response;
  }

  Future<http.Response> loginUser(ModelUser user)async{

    final uri = Uri.parse("${Pool.connectionString}/User/Login");
    late http.Response response;

    try{
      response = await http.post(uri, headers: <String, String>{
        'Content-type':'application/json; charset=UTF-8'
      },body: json.encode(user));
    }
    catch(e){
      return response;
    }

    return response;
  }

  Future<http.Response> findUser(int id) async{

    final uri = Uri.parse("${Pool.connectionString}/User/GetUser?id=$id");
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

  Future<ModelUser> findUserByMail(String mail)async{
    // return await refUser.where("email", isEqualTo: mail).get().then((value){
    //   return ModelUser.fromJson(value.docs.first.data());
    // });
    return ModelUser.empty();
  }

  Future<bool> findResetLog(String mail)async{
    // DateTime findLogDate = DateTime.now().add(const Duration(minutes: -1));
    // return await refUserLog.where("email", isEqualTo: mail).where("recordType", isEqualTo: recordTypes.PASSWORDCHANGE).where("recordDate", isGreaterThan: findLogDate).get().then((value){
    //   if(value.docs.isNotEmpty){
    //     return true;
    //   }
    //   return false;
    // });
    return false;
  }
}