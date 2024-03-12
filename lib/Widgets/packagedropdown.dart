// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputcheckvalid.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputfrequency.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputgender.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputheight.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputkg.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownGender extends StatelessWidget {
  DropDownGender(this.list, this.controller, this.icon, {super.key});

  List<DropdownMenuItem> list;
  int? controller;
  Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Sizes.height / 15,
            width: Sizes.width / 4,
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField2(
                isExpanded: true,
                decoration: InputDecoration(
                  // Add Horizontal padding using menuItemStyleData.padding so it matches
                  // the menu padding when button's width is not specified.
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0, color: ColorC.foregroundColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Add more decoration..
                ),
                hint: const Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        ConstantText.GENDER,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: list,
                validator: (value) {
                  if (value == null) {
                    return ConstantText.GENDER;
                  }
                  return null;
                },
                onChanged: (value) {
                  SignUp.genderController = value;
                  context.read<CubitInputGender>().isGenderValid(value);
                  context.read<CubitInputCheckValid>().checkValidSignUp();
                },
                onSaved: (value) {
                  SignUp.genderController = value;
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: 160,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: ColorC.foregroundColor,
                  ),
                  elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  iconSize: 24,
                  iconEnabledColor: Colors.white,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorC.foregroundColor),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: Sizes.height / 100),
              child: icon)
        ],
      ),
    );
  }
}

class DropDownKg extends StatelessWidget {
  DropDownKg(this.list, this.controller, this.icon, {super.key});

  List<DropdownMenuItem> list;
  int? controller;
  Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Sizes.height / 15,
            width: Sizes.width / 4,
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField2(
                isExpanded: true,
                decoration: InputDecoration(
                  // Add Horizontal padding using menuItemStyleData.padding so it matches
                  // the menu padding when button's width is not specified.
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0, color: ColorC.foregroundColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Add more decoration..
                ),
                hint: const Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        ConstantText.KG,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: list,
                validator: (value) {
                  if (value == null) {
                    return ConstantText.KG;
                  }
                  return null;
                },
                onChanged: (value) {
                  SignUp.kgController = value;
                  context.read<CubitInputKg>().isKgValid(value);
                  context.read<CubitInputCheckValid>().checkValidSignUp();
                },
                onSaved: (value) {
                  SignUp.kgController = value;
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: 160,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: ColorC.foregroundColor,
                  ),
                  elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  iconSize: 24,
                  iconEnabledColor: Colors.white,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorC.foregroundColor),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: Sizes.height / 100),
              child: icon)
        ],
      ),
    );
  }
}

class DropDownHeight extends StatelessWidget {
  DropDownHeight(this.list, this.controller, this.icon, {super.key});

  List<DropdownMenuItem> list;
  int? controller;
  Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Sizes.height / 15,
            width: Sizes.width / 4,
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField2(
                isExpanded: true,
                decoration: InputDecoration(
                  // Add Horizontal padding using menuItemStyleData.padding so it matches
                  // the menu padding when button's width is not specified.
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0, color: ColorC.foregroundColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Add more decoration..
                ),
                hint: const Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        ConstantText.HEIGHT,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: list,
                validator: (value) {
                  if (value == null) {
                    return ConstantText.HEIGHT;
                  }
                  return value;
                },
                onChanged: (value) {
                  SignUp.heightController = value;
                  context.read<CubitInputHeight>().isHeightValid(value);
                  context.read<CubitInputCheckValid>().checkValidSignUp();
                },
                onSaved: (value) {
                  SignUp.heightController = value;
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: 160,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: ColorC.foregroundColor,
                  ),
                  elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  iconSize: 24,
                  iconEnabledColor: Colors.white,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorC.foregroundColor),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: Sizes.height / 100),
              child: icon)
        ],
      ),
    );
  }
}

class DropDownFrequency extends StatelessWidget {
  DropDownFrequency(this.list, this.controller, this.icon, {super.key});

  List<DropdownMenuItem> list;
  int? controller;
  Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Sizes.width / 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Sizes.height / 15,
            width: Sizes.width / 1.6,
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField2(
                isExpanded: true,
                decoration: InputDecoration(
                  // Add Horizontal padding using menuItemStyleData.padding so it matches
                  // the menu padding when button's width is not specified.
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0, color: ColorC.foregroundColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Add more decoration..
                ),
                hint: const Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        ConstantText.FREQUENCY,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: list,
                validator: (value) {
                  if (value == null) {
                    return ConstantText.FREQUENCY;
                  }
                  return null;
                },
                onChanged: (value) {
                  SignUp.frequencyController = value;
                  context.read<CubitInputFrequency>().isFrequencyValid(value);
                  context.read<CubitInputCheckValid>().checkValidSignUp();
                },
                onSaved: (value) {
                  SignUp.frequencyController = value;
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: 160,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: ColorC.foregroundColor,
                  ),
                  elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  iconSize: 24,
                  iconEnabledColor: Colors.white,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorC.foregroundColor),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: Sizes.height / 100),
              child: icon)
        ],
      ),
    );
  }
}