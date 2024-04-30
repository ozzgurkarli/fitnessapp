// ignore_for_file: must_be_immutable

import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modelmove.dart';
import 'package:fitnessapp/cubit/program-workout-move/cubitmove.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MuscleCatalog extends StatefulWidget {
  MuscleCatalog(this.muscleName, {super.key});

  List<String> muscleName;

  @override
  State<MuscleCatalog> createState() => _MuscleCatalogState();
}

class _MuscleCatalogState extends State<MuscleCatalog> {
  @override
  Widget build(BuildContext context) {
    context.read<CubitMove>().getMovesByMuscle(context, widget.muscleName[0]);
    return Scaffold(
      backgroundColor: ColorC.backgroundColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: ColorC.thirdColor,
        surfaceTintColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            SafeArea(child: BlocBuilder<CubitMove, List<ModelMove>>(
                builder: (context, moveList) {
              moveList.sort(
                (a, b) => a.id.compareTo(b.id),
              );
              return SizedBox(
                width: Sizes.width / 1.6,
                height: Sizes.height / 1.1,
                child: ListView.builder(
                  itemCount: moveList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(Sizes.height * 0.01),
                      child: Container(
                        height: Sizes.height / 11,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: const LinearGradient(
                                colors: ColorC.defaultGradient)),
                        child: Align(
                            child: Text(
                          moveList[index].moveName,
                          style: const TextStyle(
                              color: ColorC.textColor,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    );
                  },
                ),
              );
            }))
          ],
        ),
      ),
    );
  }
}
