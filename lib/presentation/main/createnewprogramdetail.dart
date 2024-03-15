import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/cubit/newprogramscreen/cubitcreateprogrammoveslist.dart';
import 'package:fitnessapp/cubit/newprogramscreen/cubitcreateprogramscreenproperties.dart';
import 'package:fitnessapp/widgets/createprogrampage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewProgramDetail extends StatefulWidget {
  const CreateNewProgramDetail({super.key});

  @override
  State<CreateNewProgramDetail> createState() => _CreateNewProgramDetailState();
}

class _CreateNewProgramDetailState extends State<CreateNewProgramDetail> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    context.read<CubitCreateProgramScreenProperties>().setProperties();
    return Scaffold(
      backgroundColor: ColorC.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: ColorC.foregroundColor,
        surfaceTintColor: Colors.transparent,
      ),
      body: Center(child:
          BlocBuilder<CubitCreateProgramScreenProperties, List<List<String>>>(
              builder: (context, state) {
        return PageView.builder(
          itemCount: state.length,
          controller: controller,
          itemBuilder: (contextx, index) {
            context.read<CubitCreateProgramMovesList>().clearList();
            return CreateProgramPage(state[index], controller);
          },
        );
      })),
    );
  }
}
