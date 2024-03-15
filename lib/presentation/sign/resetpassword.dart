// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:fitnessapp/widgets/assets.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputmail.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputresetpasswordvalid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key});

  static bool mailValid = false;


  @override
  State<ResetPassword> createState() => _SignInState();
}

class _SignInState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    context.read<CubitInputResetPasswordValid>().checkValidReset();

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorC.backgroundColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Sizes.height / 50,
                ),
                const Logo(),
                SizedBox(
                  height: Sizes.height / 6,
                ),
                Container(
                  margin: EdgeInsets.only(left: Sizes.width / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Sizes.height / 15,
                        width: Sizes.width / 1.6,
                        child: CustomizedTextField(
                            emailController, ConstantText.EMAIL[ConstantText.index], false),
                      ),
                      BlocBuilder<CubitInputMail, Widget>(
                        builder: (context, icon) {
                          return icon;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Sizes.height / 7.4,
                ),
                BlocBuilder<CubitInputResetPasswordValid, bool>(
                  builder: (contextt, state) {
                    return CustomizedElevatedButton(() async {
                        await context.read<CubitInputResetPasswordValid>().resetPasswordMail(context, emailController.text);
                    }, ConstantText.CONTINUE[ConstantText.index], Icons.keyboard_arrow_right, 0, MainAxisAlignment.center);
                  },
                ),
                SizedBox(
                  height: Sizes.height / 17,
                ),
                TextButton(
                    onPressed: () {Navigator.pop(context);},
                    child: Text(
                      ConstantText.TURNBACK[ConstantText.index],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
