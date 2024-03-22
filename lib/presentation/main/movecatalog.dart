import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/presentation/helpers/musclecatalog.dart';
import 'package:fitnessapp/widgets/assets.dart';
import 'package:flutter/material.dart';

class MoveCatalog extends StatefulWidget {
  const MoveCatalog({super.key});

  @override
  State<MoveCatalog> createState() => _MoveCatalogState();
}

class _MoveCatalogState extends State<MoveCatalog> {
  List<List<String>> muscleList = [
    ConstantText.CHEST,
    ConstantText.SHOULDER,
    ConstantText.BACK,
    ConstantText.BICEPS,
    ConstantText.TRICEPS,
    ConstantText.LEG,
    ConstantText.ABDOMEN,
    ConstantText.CARDIO
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorC.backgroundColor,
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: Sizes.height / 22,
          ),
          const Logo(),
          SizedBox(
            height: Sizes.height / 25,
          ),
          SizedBox(
            width: Sizes.width * 43 / 60,
            height: Sizes.height *24/55,
            child: PageView.builder(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: muscleList.length ~/ 4,
              itemBuilder: (context, pageIndex) {
                return SizedBox(
                  width: Sizes.width * 43 / 60,
                  height: Sizes.height *24/55,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: muscleList.length ~/ 2,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: Sizes.height / 55,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorC.thirdColor,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'lib/common/assets/${muscleList[index + (muscleList.length ~/ 2 * pageIndex)][0]}.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(12)),
                              width: Sizes.width * 43 / 60,
                              height: Sizes.height / 11,
                              child: ListTile(
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> MuscleCatalog(muscleList[index + (muscleList.length ~/ 2 * pageIndex)])));},
                                tileColor: Colors.transparent,
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      muscleList[index +
                                          (muscleList.length ~/
                                              2 *
                                              pageIndex)][ConstantText.index],
                                      style: const TextStyle(
                                          color: ColorC.textColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
