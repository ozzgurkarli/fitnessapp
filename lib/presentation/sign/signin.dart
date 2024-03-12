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

  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    context.read<CubitInputMail>().isMailValid(SignIn.emailController.text);
    context
        .read<CubitInputPassword>()
        .isPasswordValid(SignIn.passwordController.text);
    context.read<CubitInputSignInValid>().checkValidSignIn();

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
                    return CustomizedInputRowText(SignIn.emailController,
                        ConstantText.EMAIL, state, false);
                  },
                ),
                BlocBuilder<CubitInputPassword, Widget>(
                  builder: (context, state) {
                    return CustomizedInputRowPassword(SignIn.passwordController,
                        ConstantText.PASSWORD, state, true);
                  },
                ),
                SizedBox(
                  height: Sizes.height / 17,
                ),
                BlocBuilder<CubitInputSignInValid, bool>(
                  builder: (contextt, state) {
                    return CustomizedElevatedButton(() async {
                      if (state) {
                        await context
                            .read<CubitInputSignInValid>()
                            .checkValidSignInHelper(context);
                      }
                    }, ConstantText.SIGNIN, Icons.keyboard_arrow_right, 0);
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
                    child: const Text(
                      ConstantText.FORGOTPASSWORD,
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                    child: const Text(
                      ConstantText.CREATEACCOUNT,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
