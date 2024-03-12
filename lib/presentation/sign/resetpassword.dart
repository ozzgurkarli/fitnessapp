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

  static TextEditingController emailController = TextEditingController();

  @override
  State<ResetPassword> createState() => _SignInState();
}

class _SignInState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    context.read<CubitInputMail>().isMailValid(ResetPassword.emailController.text);
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
                BlocBuilder<CubitInputMail, Widget>(
                  builder: (context, state) {
                    return CustomizedInputRowText(ResetPassword.emailController,
                        ConstantText.EMAIL, state, false);
                  },
                ),
                SizedBox(
                  height: Sizes.height / 7.4,
                ),
                BlocBuilder<CubitInputResetPasswordValid, bool>(
                  builder: (contextt, state) {
                    return CustomizedElevatedButton(() async {
                        await context.read<CubitInputResetPasswordValid>().resetPasswordMail(context);
                    }, ConstantText.CONTINUE, Icons.keyboard_arrow_right, 0);
                  },
                ),
                SizedBox(
                  height: Sizes.height / 17,
                ),
                TextButton(
                    onPressed: () {Navigator.pop(context);},
                    child: const Text(
                      ConstantText.TURNBACK,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
