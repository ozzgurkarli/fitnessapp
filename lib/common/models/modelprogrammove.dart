class ModelProgramMove
{
  int? programId;
  int? moveId;
  String? muscle;
  int? repeat;
  double? weight;
  int? duration;
  int? index;

  ModelProgramMove(this.moveId, this.muscle, this.index, {this.programId, this.weight, this.repeat, this.duration}): super();
  ModelProgramMove.empty();
}