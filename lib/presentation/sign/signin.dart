// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:fitnessapp/widgets/assets.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputmail.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputpassword.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputsigninvalid.dart';
import 'package:fitnessapp/presentation/sign/resetpassword.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  static bool mailValid = false;
  static bool passwordValid = false;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    context.read<CubitInputSignInValid>().checkValidSignIn();

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
                  Container(
                    margin: EdgeInsets.only(left: Sizes.width / 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Sizes.height / 15,
                          width: Sizes.width / 1.6,
                          child: CustomizedTextFieldPassword(
                              passwordController, ConstantText.PASSWORD[ConstantText.index]),
                        ),
                        BlocBuilder<CubitInputPassword, Widget>(
                          builder: (context, icon) {
                            return icon;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Sizes.height / 17,
                  ),
                  BlocBuilder<CubitInputSignInValid, bool>(
                    builder: (contextt, state) {
                      return CustomizedElevatedButton(() async {
                        await context
                            .read<CubitInputSignInValid>()
                            .checkValidSignInHelper(context, emailController.text,
                                passwordController.text);
                      }, ConstantText.SIGNIN[ConstantText.index], Icons.keyboard_arrow_right, 0,
                          MainAxisAlignment.center);
                    },
                  ),
                  SizedBox(
                    height: Sizes.height / 17,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPassword()));
                      },
                      child: Text(
                        ConstantText.FORGOTPASSWORD[ConstantText.index],
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: Text(
                        ConstantText.CREATEACCOUNT[ConstantText.index],
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
