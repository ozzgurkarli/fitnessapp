// ignore_for_file: use_build_context_synchronously

import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/presentation/main/createnewprogramdetail.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitDropdownProgramItems extends Cubit<void> {
  CubitDropdownProgramItems() : super(const Placeholder());

  List<DropdownMenuItem> list = [];

  void listOfPrograms(BuildContext context) {
    list.clear();

    showOptions(context);
  }

  Future<Widget?> showOptions(BuildContext context)async{
    return await showDialog(
        context: context,
        barrierColor: Colors.black87,
        builder: (context) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  SizedBox(
                    width: Sizes.width / 1.6,
                    child: CustomizedElevatedButton(
                        () {Navigator.pop(context);
                        showOptions(context);},
                        ConstantText.ADDFROMPROGRAMS[ConstantText.index],
                        Icons.add,
                        0,
                        MainAxisAlignment.spaceBetween),
                  ),
                  SizedBox(height: Sizes.height/40,),
                  SizedBox(
                    width: Sizes.width / 1.6,
                    child: CustomizedElevatedButton(
                        () {Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateNewProgramDetail()));},
                        ConstantText.CREATENEWPROGRAM[ConstantText.index],
                        Icons.add,
                        0,
                        MainAxisAlignment.spaceBetween),
                  ),
                  SizedBox(height: Sizes.height/40,),
                  SizedBox(
                    width: Sizes.width / 1.6,
                    child: CustomizedElevatedButton(
                        () {},
                        ConstantText.ASKAITOCREATE[ConstantText.index],
                        Icons.add,
                        0,
                        MainAxisAlignment.spaceBetween, gradientColor: ColorC.premiumGradient,weight: FontWeight.w800,),
                  ),
                  SizedBox(height: Sizes.height/40,),
                  SizedBox(
                    width: Sizes.width / 1.6,
                    child: CustomizedElevatedButton(
                        () {},
                        ConstantText.ASKPTTOCREATE[ConstantText.index],
                        Icons.add,
                        0,
                        MainAxisAlignment.spaceBetween, gradientColor: ColorC.premiumGradient,weight: FontWeight.w800,),
                  ),
                ],
              ),
            ));
  }
}
