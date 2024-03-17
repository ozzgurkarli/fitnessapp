import 'package:fitnessapp/widgets/assets.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:fitnessapp/widgets/packagedropdown.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdownfrequencyitems.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdownheightitems.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdowngenderitems.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdownkgitems.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputbirthdate.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputcheckvalid.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputfrequency.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputgender.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputheight.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputkg.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputmail.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputname.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputpassword.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputsurname.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static bool nameValid = false;
  static bool surnameValid = false;
  static bool passwordValid = false;
  static bool mailValid = false;
  static bool birthDateValid = false;
  static bool genderValid = false;
  static bool heightValid = false;
  static bool kgValid = false;
  static bool frequencyValid = false;

  static TextEditingController nameController = TextEditingController();
  static TextEditingController surnameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController birthDateController = TextEditingController();
  static int? genderController;
  static int? heightController;
  static int? kgController;
  static int? frequencyController;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    context.read<CubitDropdownGenderItems>().listOfGenders();
    context.read<CubitDropdownHeightItems>().listOfHeights();
    context.read<CubitDropdownKgItems>().listOfKgs();
    context.read<CubitDropdownFrequencyItems>().listOfFrequencies();
    context.read<CubitInputCheckValid>().checkValidSignUp();

    context.read<CubitInputName>().isNameValid(SignUp.surnameController.text);
    context
        .read<CubitInputSurname>()
        .isSurnameValid(SignUp.surnameController.text);
    context.read<CubitInputMail>().isMailValid(SignUp.emailController.text);
    context
        .read<CubitInputPassword>()
        .isPasswordValid(SignUp.passwordController.text);
    context.read<CubitInputHeight>().isHeightValid(SignUp.heightController);
    context.read<CubitInputKg>().isKgValid(SignUp.kgController);
    context
        .read<CubitInputBirthDate>()
        .isDateValid(SignUp.birthDateController.text);
    context.read<CubitInputGender>().isGenderValid(SignUp.genderController);

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
                  SizedBox(height: Sizes.height / 18),
                  const Logo(),
                  SizedBox(
                    height: Sizes.height / 50,
                  ),
                  CustomizedText(ConstantText.SIGNUP[ConstantText.index], 18),
                  SizedBox(
                    height: Sizes.height / 50,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: Sizes.width / 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: Sizes.height / 18,
                              width: Sizes.width / 4,
                              child: CustomizedTextField(SignUp.nameController,
                                  ConstantText.NAME[ConstantText.index], false),
                            ),
                            BlocBuilder<CubitInputName, Widget>(
                              builder: (context, icon) {
                                return icon;
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: Sizes.height / 18,
                              width: Sizes.width / 4,
                              child: CustomizedTextField(
                                  SignUp.surnameController,
                                  ConstantText.SURNAME[ConstantText.index],
                                  false),
                            ),
                            BlocBuilder<CubitInputSurname, Widget>(
                              builder: (context, icon) {
                                return icon;
                              },
                            ),
                          ],
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
            height: Sizes.height / 18,
                          width: Sizes.width / 1.6,
                          child: CustomizedTextField(SignUp.emailController,
                              ConstantText.EMAIL[ConstantText.index], false),
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
            height: Sizes.height / 18,
                          width: Sizes.width / 1.6,
                          child: CustomizedTextFieldPassword(
                              SignUp.passwordController,
                              ConstantText.PASSWORD[ConstantText.index]),
                        ),
                        BlocBuilder<CubitInputPassword, Widget>(
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
                        BlocBuilder<CubitDropdownGenderItems,
                            List<DropdownMenuItem>>(
                          builder: (context, list) {
                            return BlocBuilder<CubitInputGender, Widget>(
                              builder: (context, state) {
                                return DropDownGender(
                                    list, SignUp.genderController, state);
                              },
                            );
                          },
                        ),
                        BlocBuilder<CubitInputBirthDate, Widget>(
                          builder: (context, state) {
                            return CustomizedSignUpDatePicker(state);
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
                        BlocBuilder<CubitDropdownHeightItems,
                            List<DropdownMenuItem>>(
                          builder: (context, list) {
                            return BlocBuilder<CubitInputHeight, Widget>(
                              builder: (context, state) {
                                return DropDownHeight(
                                    list, SignUp.heightController, state);
                              },
                            );
                          },
                        ),
                        BlocBuilder<CubitDropdownKgItems,
                            List<DropdownMenuItem>>(
                          builder: (context, list) {
                            return BlocBuilder<CubitInputKg, Widget>(
                              builder: (context, state) {
                                return DropDownKg(
                                    list, SignUp.kgController, state);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<CubitDropdownFrequencyItems,
                      List<DropdownMenuItem>>(
                    builder: (context, list) {
                      return BlocBuilder<CubitInputFrequency, Widget>(
                        builder: (context, state) {
                          return DropDownFrequency(
                              list, SignUp.frequencyController, state);
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: Sizes.height / 40,
                  ),
                  BlocBuilder<CubitInputCheckValid, Widget>(
                    builder: (context, state) {
                      return CustomizedElevatedButton(
                        () {
                          showDialog(
                              context: context, builder: (context) => state);
                        },
                        ConstantText.CONTINUE[ConstantText.index],
                        Icons.keyboard_arrow_right,
                        0,
                        MainAxisAlignment.center,
                        customWidth: Sizes.width / 3.3,
                      );
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        ConstantText.SIGNIN[ConstantText.index],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
