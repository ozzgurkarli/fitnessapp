import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/models/modelidcount.dart';

class DatabaseIDCount
{
  var refCount = FirebaseFirestore.instance.collection("IDCOUNT");

  Future<int> getCountAndIncrease(String type)async{
    return await refCount.where("type", isEqualTo: type).get().then((value){
      var info = ModelIDCount.fromJson(value.docs.first.data());
      info.id += 1;
      refCount.doc(value.docs.first.id).update(info.toJson());
      return info.id-1;
    });
  }
}