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
import 'package:fitnessapp/cubit/welcome/cubitwelcomelanguage.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';
import 'package:fitnessapp/widgets/createprogrampage.dart';
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
            height: Sizes.height / 18,
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
                        const BorderSide(width: 0, color: ColorC.foregroundColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Add more decoration..
                ),
                hint: Row(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        ConstantText.GENDER[ConstantText.index],
                        style: const TextStyle(
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
                    return ConstantText.GENDER[ConstantText.index];
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
            height: Sizes.height / 18,
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
                        const BorderSide(width: 0, color: ColorC.foregroundColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Add more decoration..
                ),
                hint: Row(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        ConstantText.KG[ConstantText.index],
                        style: const TextStyle(
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
                    return ConstantText.KG[ConstantText.index];
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
            height: Sizes.height / 18,
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
                        const BorderSide(width: 0, color: ColorC.foregroundColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Add more decoration..
                ),
                hint: Row(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        ConstantText.HEIGHT[ConstantText.index],
                        style: const TextStyle(
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
                    return ConstantText.HEIGHT[ConstantText.index];
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

class DropDownLanguage extends StatelessWidget {
  DropDownLanguage(this.list, this.controller, {super.key});

  List<DropdownMenuItem> list;
  int? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: Sizes.width/8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Sizes.height / 18,
            width: Sizes.width / 3.3,
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField2(
                isExpanded: true,
                decoration: InputDecoration(
                  // Add Horizontal padding using menuItemStyleData.padding so it matches
                  // the menu padding when button's width is not specified.
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Add more decoration..
                ),
                hint: Row(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        ConstantText.SELECTLANGUAGE[ConstantText.index],
                        style: const TextStyle(
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
                    return ConstantText.SELECTLANGUAGE[ConstantText.index];
                  }
                  return null;
                },
                onChanged: (value) {
                  ConstantText.index = value;
                  context.read<CubitWelcomeLanguage>().changeLanguage(context);
                },
                onSaved: (value) {
                  ConstantText.index = value;
                  context.read<CubitWelcomeLanguage>().changeLanguage(context);
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
            height: Sizes.height / 18,
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
                        const BorderSide(width: 0, color: ColorC.foregroundColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Add more decoration..
                ),
                hint: Row(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        ConstantText.FREQUENCY[ConstantText.index],
                        style: const TextStyle(
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
                    return ConstantText.FREQUENCY[ConstantText.index];
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


class DropDownProgram extends StatelessWidget {
  DropDownProgram(this.list, {super.key});

  List<DropdownMenuItem> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Sizes.width / 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Sizes.height / 18,
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
                        const BorderSide(width: 0, color: ColorC.foregroundColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Add more decoration..
                ),
                hint: Row(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        ConstantText.ADDPROGRAMTODAY[ConstantText.index],
                        style: const TextStyle(
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
                    return ConstantText.ADDPROGRAMTODAY[ConstantText.index];
                  }
                  return ConstantText.ADDPROGRAMTODAY[ConstantText.index];
                },
                onChanged: (value) {
                },
                onSaved: (value) {
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
                    gradient: const LinearGradient(colors: ColorC.defaultGradient)
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
                      gradient: const LinearGradient(colors: ColorC.defaultGradient),
                      color: ColorC.foregroundColor),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DropDownMove extends StatelessWidget {
  DropDownMove(this.list, {super.key});

  List<DropdownMenuItem> list;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Sizes.height / 18,
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
                        const BorderSide(width: 0, color: ColorC.foregroundColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Add more decoration..
                ),
                hint: Row(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        ConstantText.SELECTMOVE[ConstantText.index],
                        style: const TextStyle(
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
                    return ConstantText.SELECTMOVE  [ConstantText.index];
                  }
                  return null;
                },
                onChanged: (value) {
                  CreateProgramPage.moveController = value;
                },
                onSaved: (value) {
                  CreateProgramPage.moveController = value;
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
                dropdownSearchData: DropdownSearchData(searchController: searchController, searchInnerWidgetHeight: 200, searchInnerWidget: SearchBar(leading: const Icon(Icons.search), controller: searchController, shape: MaterialStateProperty.all<OutlinedBorder?>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
