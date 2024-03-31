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
import 'package:fitnessapp/cubit/signinputs/cubitinputcheckvalid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static TextEditingController nameController = TextEditingController();
  static TextEditingController surnameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController birthDateController = TextEditingController();
  static int? genderController;
  static TextEditingController invitationCodeController = TextEditingController();

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
    context.read<CubitInputCheckValid>().checkValidSignUp(context);

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
                  SizedBox(height: Sizes.height / 27),
                  const Logo(),
                  SizedBox(
                    height: Sizes.height / 50,
                  ),
                  CustomizedText(ConstantText.SIGNUP[ConstantText.index], 17),
                  SizedBox(
                    height: Sizes.height / 17,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Sizes.height / 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Sizes.height / 18,
                          width: Sizes.width / 3.4,
                          child: CustomizedTextField(SignUp.nameController,
                              ConstantText.NAME[ConstantText.index], false),
                        ),
                        SizedBox(
                          width: Sizes.width / 27.2,
                        ),
                        SizedBox(
                          height: Sizes.height / 18,
                          width: Sizes.width / 3.4,
                          child: CustomizedTextField(SignUp.surnameController,
                              ConstantText.SURNAME[ConstantText.index], false),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Sizes.height / 100),
                    child: SizedBox(
                      height: Sizes.height / 18,
                      width: Sizes.width / 1.6,
                      child: CustomizedTextField(SignUp.emailController,
                          ConstantText.EMAIL[ConstantText.index], false),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Sizes.height / 100),
                    child: SizedBox(
                      height: Sizes.height / 18,
                      width: Sizes.width / 1.6,
                      child: CustomizedTextFieldPassword(
                          SignUp.passwordController,
                          ConstantText.PASSWORD[ConstantText.index]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Sizes.height / 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BlocBuilder<CubitDropdownGenderItems,
                                List<DropdownMenuItem>>(
                              builder: (context, list) {
                                return DropDownGender(
                                    list, SignUp.genderController);
                              },
                            ),
                            SizedBox(
                              width: Sizes.width / 27.2,
                            ),
                            CustomizedSignUpDatePicker(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Sizes.height / 100),
                    child: SizedBox(
                      height: Sizes.height / 18,
                      width: Sizes.width / 1.6,
                      child: CustomizedTextField(SignUp.invitationCodeController,
                          ConstantText.INVITATIONCODE[ConstantText.index], false),
                    ),
                  ),
                  SizedBox(
                    height: Sizes.height / 17,
                  ),
                  BlocBuilder<CubitInputCheckValid, Widget>(
                    builder: (context, state) {
                      return CustomizedElevatedButton(
                        () {
                            context.read<CubitInputCheckValid>().checkValidSignUp(context);
                            if(state is SnackBar){
                              ScaffoldMessenger.of(context).showSnackBar(state);
                            }
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
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(ColorC.thirdColor),
                      ),
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
