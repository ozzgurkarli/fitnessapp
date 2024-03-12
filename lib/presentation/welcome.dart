import 'package:fitnessapp/Widgets/customizedwidgets.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/cubit/welcome/cubitwelcometext.dart';
import 'package:fitnessapp/cubit/welcome/cubitwelcomebutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  Widget build(BuildContext context) {
    context.read<CubitWelcomeButton>().isUserRegistered();
    context.read<CubitWelcomeText>().isUserRegistered();

    return Scaffold(
      backgroundColor: ColorC.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: Sizes.height/7,),
            
            Image.asset('lib/common/assets/animation_logo.gif'),

            BlocBuilder<CubitWelcomeText,String>(builder: (context, state) {
              return CustomizedText(state.toString(), 24);
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
    );
  }
}