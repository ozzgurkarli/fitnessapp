// ignore_for_file: must_be_immutable, use_build_context_synchronously, empty_catches

import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomizedTextField extends StatelessWidget {
  CustomizedTextField(this.controller, this.labelText, this.obsecure,
      {super.key});

  TextEditingController controller;
  String labelText;
  bool obsecure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.words,
      keyboardType: obsecure ? TextInputType.number : TextInputType.text,
      controller: controller,
      onChanged: (value) {
      },
      obscureText: obsecure,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
      decoration: InputDecoration(
          labelText: labelText,
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: ColorC.foregroundColor)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: ColorC.foregroundColor)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: ColorC.foregroundColor)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: ColorC.foregroundColor)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: ColorC.foregroundColor))),
    );
  }
}

class CustomizedTextFieldPassword extends StatelessWidget {
  CustomizedTextFieldPassword(this.controller, this.labelText, {super.key});

  TextEditingController controller;

  String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.number,
      controller: controller,
      onChanged: (value) {
        try {
          int.parse(value);
        } catch (e) {
          if (controller.text.length > 0) {
            controller.text =
                controller.text.substring(0, controller.text.length - 1);
          }
        }
      },
      obscureText: true,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
      decoration: InputDecoration(
          labelText: labelText,
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: ColorC.foregroundColor)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: ColorC.foregroundColor)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: ColorC.foregroundColor)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: ColorC.foregroundColor)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: ColorC.foregroundColor))),
    );
  }
}

class CustomizedElevatedButton extends StatelessWidget {
  CustomizedElevatedButton(
      this.onPressed, this.text, this.icon, this.rightMargin, this.alignment,
      {super.key, this.gradientColor, this.weight, this.customWidth, this.leftTextMargin, this.rightTextMargin});

  final VoidCallback? onPressed;
  String text;
  IconData icon;
  double? customWidth;
  double rightMargin;
  double? leftTextMargin;
  double? rightTextMargin;
  FontWeight? weight;
  MainAxisAlignment alignment;
  List<Color>? gradientColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0.0),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          surfaceTintColor: Colors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
                colors: gradientColor ?? ColorC.defaultGradient)),
        child: Container(
          width: customWidth ?? Sizes.width / 3.9,
          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 48),
          margin: EdgeInsets.only(right: rightMargin),
          child: Padding(
            padding: EdgeInsets.only(left: leftTextMargin ?? 0, right: rightTextMargin ?? 0),
            child: Row(
              mainAxisAlignment: alignment,
              children: [
                Text(
                  text,
                  style: TextStyle(fontWeight: weight ?? FontWeight.w500, fontSize: 13),
                ),
                Icon(icon)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomizedText extends StatelessWidget {
  CustomizedText(this.text, this.size, {super.key});

  String text;
  double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: ColorC.thirdColor),
    );
  }
}

class CustomizedSignUpDatePicker extends StatelessWidget {
  CustomizedSignUpDatePicker({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: Sizes.height / 18,
          width: Sizes.width / 3.4,
          child: TextField(
            controller: SignUp.birthDateController,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
            decoration: InputDecoration(
                labelText: ConstantText.BIRTHDATE[ConstantText.index],
                filled: true,
                prefixIcon: const Icon(
                  Icons.calendar_today,
                  color: ColorC.foregroundColor,
                ),
                disabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: ColorC.foregroundColor)),
                focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: ColorC.foregroundColor)),
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: ColorC.foregroundColor)),
                errorBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: ColorC.foregroundColor)),
                border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: ColorC.foregroundColor))),
            readOnly: true,
            onTap: () {
              selectDate(context);
            },
          ),
        );
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now().add(const Duration(days: -7300)),
        firstDate: DateTime(1900),
        lastDate: DateTime(DateTime.now().year));

    if (dateTime != null) {
      SignUp.birthDateController.text = dateTime.toString().split(" ")[0];
    }
  }
}
