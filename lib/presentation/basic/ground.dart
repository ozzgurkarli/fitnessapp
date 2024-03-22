import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/database/databaseuser.dart';
import 'package:fitnessapp/presentation/main/movecatalog.dart';
import 'package:fitnessapp/presentation/main/workouts.dart';
import 'package:fitnessapp/widgets/packagenavbar.dart';
import 'package:flutter/material.dart';

class Ground extends StatefulWidget {
  const Ground({super.key});

  @override
  State<Ground> createState() => _HomeState();
}

class _HomeState extends State<Ground> {

  int selectedIndex = 0;

  void NavigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  late final List<Widget> pages = [
    const Workouts(),
    const Workouts(),
    const MoveCatalog(),
    const Workouts(),
  ];

  DatabaseUser db = DatabaseUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorC.backgroundColor,
      bottomNavigationBar: BottomNavBar(onTabChange: (index) => NavigateBottomBar(index),),
      body: SafeArea(child: pages[selectedIndex]),
    );
  }
}