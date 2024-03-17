// ignore_for_file: library_private_types_in_public_api

import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdowncreateprogramitems.dart';
import 'package:fitnessapp/widgets/assets.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Workouts extends StatefulWidget {
  const Workouts({super.key});

  @override
  State<Workouts> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorC.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: Sizes.height / 18,
            ),
            const Logo(),
            SizedBox(
              height: Sizes.height / 18,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(12)),
              width: Sizes.width * 43 / 60,
              height: Sizes.height / 10,
              child: ListTile(
                onTap: () {},
                tileColor: Colors.transparent,
                subtitle: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Buraya reklamınızı koyabilirsiniz...",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Sizes.height / 50,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(12)),
              width: Sizes.width * 43 / 60,
              height: Sizes.height / 10,
              child: ListTile(
                onTap: () {},
                tileColor: Colors.transparent,
                subtitle: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Buraya reklamınızı koyabilirsiniz...",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Sizes.height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: Sizes.width / 2,
                    child: BlocBuilder<CubitDropdownProgramItems, void>(
                        builder: (context, state) {
                      return CustomizedElevatedButton(() {
                        context
                            .read<CubitDropdownProgramItems>()
                            .listOfPrograms(context);
                      },
                          ConstantText.ADDPROGRAMTODAY[ConstantText.index],
                          Icons.keyboard_arrow_down,
                          0,
                          MainAxisAlignment.spaceBetween);
                    })),
                SizedBox(
                  width: Sizes.width / 20,
                ),
                SizedBox(
                    width: Sizes.width / 6,
                    child: BlocBuilder<CubitDropdownProgramItems, void>(
                        builder: (context, state) {
                      return CustomizedElevatedButton(() {
                        context
                            .read<CubitDropdownProgramItems>()
                            .listOfPrograms(context);
                      }, "", Icons.history, 0, MainAxisAlignment.spaceBetween);
                    }))
              ],
            ),
            SizedBox(
              height: Sizes.height / 20,
            ),
          ],
        )),
      ),
    );
  }
}
