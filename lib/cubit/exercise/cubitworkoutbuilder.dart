import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modelworkout.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:fitnessapp/database/databaseworkout.dart';
import 'package:fitnessapp/widgets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitWorkoutBuilder extends Cubit<Widget> {
  CubitWorkoutBuilder() : super(const Center(child: Loading()));

  DatabaseWorkout dbExercise = DatabaseWorkout();
  SPChanges spChanges = SPChanges();

  void workoutsPage() async {
    int userId = await spChanges.readID();
    List<ModelWorkout> list = [];
    emit(FutureBuilder(
      future: dbExercise.getWorkoutsLast12Hour(userId),
      builder: (context, fList) {
        if (fList.hasData) {
          list = fList.data!;
          list.sort((a, b) => b.recordDate.compareTo(a.recordDate));

          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: list.first.completed
                        ? ColorC.defaultGradient
                        : ColorC.faultGradient),
                borderRadius: BorderRadius.circular(12)),
            width: Sizes.width * 43 / 60,
            height: Sizes.height / 10,
            child: ListTile(
              onTap: () {},
              tileColor: Colors.transparent,
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    list.first.programName,
                    style: const TextStyle(
                        color: ColorC.textColor, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    list.first.completed
                        ? list.first.duration.toString()
                        : ConstantText.NOTSTARTED[ConstantText.index],
                    style: const TextStyle(
                        color: ColorC.textColor, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          );
        } else if (fList.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Loading(),
          );
        } else {
          return SizedBox(
            width: Sizes.width * 43 / 60,
            height: Sizes.height / 10,
            child: Center(
              child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      margin: EdgeInsets.all(Sizes.height / 20),
                      content: Align(
                          alignment: Alignment.center,
                          child:
                              Text(ConstantText.NOWORKOUTFOUNDIN12HOURS[ConstantText.index])),
                      backgroundColor: ColorC.foregroundColor,
                      showCloseIcon: true,
                      closeIconColor: ColorC.thirdColor,
                      behavior: SnackBarBehavior.floating,
                    ));
                  },
                  child: const NoData()),
            ),
          );
        }
      },
    ));
  }
}
