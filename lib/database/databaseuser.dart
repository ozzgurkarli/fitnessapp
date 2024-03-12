import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/constants/recordtypes.dart';
import 'package:fitnessapp/common/models/modeluser.dart';

class DatabaseUser
{
  var refUser = FirebaseFirestore.instance.collection("USER");
  var refUserLog = FirebaseFirestore.instance.collection("LOG").doc("USER").collection("USER");

  Future<void> insertUser(ModelUser user)async{
    refUser.doc().set(user.toJson());
  }

  Future<void> insertUserLog(ModelUser userLog)async{
    refUserLog.doc().set(userLog.logToJson());
  }

  Future<ModelUser> findUser(int id) async{
    return await refUser.where("id", isEqualTo: id).get().then((value){
      return ModelUser.fromJson(value.docs.first.data());

    });
  }

  Future<ModelUser> findUserByMail(String mail)async{
    return await refUser.where("email", isEqualTo: mail).get().then((value){
      return ModelUser.fromJson(value.docs.first.data());
    });
  }

  Future<bool> findResetLog(String mail)async{
    DateTime findLogDate = DateTime.now().add(const Duration(minutes: -30));
    return await refUserLog.where("email", isEqualTo: mail).where("recordType", isEqualTo: recordTypes.PASSWORDCHANGE).where("recordDate", isGreaterThan: findLogDate).get().then((value){
      if(value.docs.isNotEmpty){
        return true;
      }
      return false;
    });
  }
}