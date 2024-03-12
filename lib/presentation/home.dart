import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/database/databaseuser.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  DatabaseUser db = DatabaseUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorC.backgroundColor,
      body: Center(
        child: Column(),
      ),
    );
  }
}