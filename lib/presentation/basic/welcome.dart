import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdownlanguage.dart';
import 'package:fitnessapp/cubit/welcome/cubitwelcomelanguage.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/cubit/welcome/cubitwelcometext.dart';
import 'package:fitnessapp/cubit/welcome/cubitwelcomebutton.dart';
import 'package:fitnessapp/widgets/packagedropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  static bool buildCompleted= false;

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  Widget build(BuildContext context) {
    context.read<CubitWelcomeButton>().isUserRegistered();
    context.read<CubitWelcomeText>().isUserRegistered();
    context.read<CubitDropDownLanguage>().listOfLanguages();

    return Scaffold(
      backgroundColor: ColorC.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: Sizes.height/15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlocBuilder<CubitWelcomeLanguage, int>(
                    builder: (context, ind) {
                      return BlocBuilder<CubitDropDownLanguage, List<DropdownMenuItem>>(
                      builder: (context, list) {
                        return DropDownLanguage(list, ConstantText.index);
                      }
                      );
                    }
                  ),
                ],
              ),
      
              
              SizedBox(
                height: Sizes.height/2,
                width: Sizes.width/2,
                child: Image.asset('lib/common/assets/animation_logo.gif')),
      
              BlocBuilder<CubitWelcomeText,String>(builder: (context, state) {
                return CustomizedText(state.toString(), 22);
              },),
      
              SizedBox(height: Sizes.height/7,),
      
              Align(
                alignment: Alignment.bottomRight,
                child:  BlocBuilder<CubitWelcomeButton,Widget>(builder: (context, state) {
                    return state;
                  },)
                ),
            ],
          ),
        ),
      ),
    );
  }
}