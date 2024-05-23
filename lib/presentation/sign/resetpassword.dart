// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:fitnessapp/widgets/assets.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
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
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Sizes.height / 27,
                  ),
                  const Logo(),
                  SizedBox(
                    height: Sizes.height / 4.35,
                  ),
                  SizedBox(
                          height: Sizes.height / 15,
                          width: Sizes.width / 1.6,
                          child: CustomizedTextField(emailController,
                              ConstantText.EMAIL[ConstantText.index], false, false),
                        ),
                  SizedBox(
                    height: Sizes.height / 7.4,
                  ),
                  CustomizedElevatedButton(() async {
                    await context
                        .read<CubitInputResetPasswordValid>()
                        .resetPasswordMail(context, emailController.text);
                  },
                      ConstantText.CONTINUE[ConstantText.index],
                      Icons.keyboard_arrow_right,
                      0,
                      MainAxisAlignment.center),
                  SizedBox(
                    height: Sizes.height / 17,
                  ),
                  TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(ColorC.thirdColor),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        ConstantText.TURNBACK[ConstantText.index],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
