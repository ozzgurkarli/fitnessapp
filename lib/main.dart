import 'dart:io';

import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdowncreateprogramitems.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdownlanguage.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdownmoves.dart';
import 'package:fitnessapp/cubit/program-workout-move/cubitbulkcounter.dart';
import 'package:fitnessapp/cubit/program-workout-move/cubitmove.dart';
import 'package:fitnessapp/cubit/program-workout-move/cubitworkoutbuilder.dart';
import 'package:fitnessapp/cubit/program-workout-move/cubitcreateprogrammoveslist.dart';
import 'package:fitnessapp/cubit/program-workout-move/cubitcreateprogramscreenproperties.dart';
import 'package:fitnessapp/cubit/program-workout-move/cubitworkouthistory.dart';
import 'package:fitnessapp/cubit/welcome/cubitwelcomelanguage.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:fitnessapp/presentation/basic/splashscreen.dart';
import 'package:fitnessapp/widgets/assets.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_core/firebase_core.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdownfrequencyitems.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdownheightitems.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdowngenderitems.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdownkgitems.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputcheckvalid.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputresetpasswordvalid.dart';
import 'package:fitnessapp/cubit/welcome/cubitwelcometext.dart';
import 'package:fitnessapp/cubit/welcome/cubitwelcomebutton.dart';
import 'package:fitnessapp/presentation/basic/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyA6SxbbIxtCd8NUJsinLALMf7LQgzjVw-c',
      appId: '1:618704980936:web:ebac5d553b5c80c8984efd',
      messagingSenderId: '618704980936',
      projectId: 'fitnessappozgur',
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Sizes.height = MediaQuery.of(context).size.height;
    Sizes.width = MediaQuery.of(context).size.width;
    SPChanges spChanges = SPChanges();

    if (kIsWeb) {
      Sizes.width = Sizes.width / 3;
    } else {
      if (Platform.isIOS) {
        Sizes.height = Sizes.height * 0.95;
        Sizes.width = Sizes.width * 1.07;
      } else {
        Sizes.height = Sizes.height * 1.03;
      }
    }
    return FutureBuilder(
        future: spChanges.getLanguage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ConstantText.index = snapshot.data!;
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => CubitWelcomeButton()),
                BlocProvider(create: (context) => CubitWelcomeText()),
                BlocProvider(create: (context) => CubitDropdownGenderItems()),
                BlocProvider(create: (context) => CubitDropdownKgItems()),
                BlocProvider(create: (context) => CubitDropdownHeightItems()),
                BlocProvider(
                    create: (context) => CubitDropdownFrequencyItems()),
                BlocProvider(create: (context) => CubitInputCheckValid()),
                BlocProvider(
                    create: (context) => CubitInputResetPasswordValid()),
                BlocProvider(create: (context) => CubitDropdownProgramItems()),
                BlocProvider(create: (context) => CubitDropDownLanguage()),
                BlocProvider(create: (context) => CubitWelcomeLanguage()),
                BlocProvider(
                    create: (context) => CubitCreateProgramScreenProperties()),
                BlocProvider(create: (context) => CubitDropDownMoves()),
                BlocProvider(
                    create: (context) => CubitCreateProgramMovesList()),
                BlocProvider(
                    create: (context) => CubitWorkoutBuilder()),
                BlocProvider(
                    create: (context) => CubitMove()),
                BlocProvider(
                    create: (context) => CubitWorkoutHistory()),
                BlocProvider(
                    create: (context) => CubitBulkCounter()),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  inputDecorationTheme: const InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                home: const SplashScreen(),
              ),
            );
          } else {
            return const Loading();
          }
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorC.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('lib/common/assets/logo.png'),
            Image.asset('lib/common/assets/animation_logo.gif'),
            // Image.asset('lib/common/assets/animation_loading.gif', height: 162, width: 162, fit: BoxFit.fill)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Welcome()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
