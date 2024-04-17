// ignore_for_file: empty_catches

class ModelProgram
{
  int id;
  int userId;
  String programName;
  List? programMoves;
  DateTime? recordDate;

  ModelProgram( this.id, this.userId, this.programName,{this.programMoves, this.recordDate});

  factory ModelProgram.fromJson(Map<dynamic, dynamic> json) {
    ModelProgram model = ModelProgram(
        json["id"] as int,
        json["userId"] as int,
        json["programName"] as String,
        recordDate: DateTime.tryParse(json["recordDate"] as String));

    try{
      model.programMoves = json["programMoves"] as List;
    }
    catch(e){
      return model;
    }

    return model;
  }

  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "userId": userId,
      "programName": programName,
      "programMoves": programMoves
    };
  }
}