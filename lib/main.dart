import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdowncreateprogramitems.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdownlanguage.dart';
import 'package:fitnessapp/cubit/welcome/cubitwelcomelanguage.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:fitnessapp/widgets/assets.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_core/firebase_core.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdownfrequencyitems.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdownheightitems.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdowngenderitems.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdownkgitems.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputbirthdate.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputcheckvalid.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputfrequency.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputgender.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputheight.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputkg.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputmail.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputname.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputonchanged.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputpassword.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputresetpasswordvalid.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputsigninvalid.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputsurname.dart';
import 'package:fitnessapp/cubit/welcome/cubitwelcometext.dart';
import 'package:fitnessapp/cubit/welcome/cubitwelcomebutton.dart';
import 'package:fitnessapp/presentation/basic/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyA6SxbbIxtCd8NUJsinLALMf7LQgzjVw-c',
    appId: '1:618704980936:web:ebac5d553b5c80c8984efd',
    messagingSenderId: '618704980936',
    projectId: 'fitnessappozgur',
  ));
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

    if(kIsWeb){
      Sizes.width = Sizes.width/3;
    }
    return FutureBuilder(
      future: spChanges.getLanguage(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          ConstantText.index = snapshot.data!;
          return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => CubitWelcomeButton()),
            BlocProvider(create: (context) => CubitWelcomeText()),
            BlocProvider(create: (context) => CubitDropdownGenderItems()),
            BlocProvider(create: (context) => CubitDropdownKgItems()),
            BlocProvider(create: (context) => CubitDropdownHeightItems()),
            BlocProvider(create: (context) => CubitDropdownFrequencyItems()),
            BlocProvider(create: (context) => CubitInputMail()),
            BlocProvider(create: (context) => CubitInputPassword()),
            BlocProvider(create: (context) => CubitInputBirthDate()),
            BlocProvider(create: (context) => CubitInputName()),
            BlocProvider(create: (context) => CubitInputSurname()),
            BlocProvider(create: (context) => CubitInputGender()),
            BlocProvider(create: (context) => CubitInputHeight()),
            BlocProvider(create: (context) => CubitInputKg()),
            BlocProvider(create: (context) => CubitInputFrequency()),
            BlocProvider(create: (context) => CubitInputCheckValid()),
            BlocProvider(create: (context) => CubitInputSignInValid()),
            BlocProvider(create: (context) => CubitInputResetPasswordValid()),
            BlocProvider(create: (context) => CubitDropdownProgramItems()),
            BlocProvider(create: (context) => CubitInputOnChanged()),
            BlocProvider(create: (context) => CubitDropDownLanguage()),
            BlocProvider(create: (context) => CubitWelcomeLanguage()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.grey), //<-- SEE HERE
              ),
            ),
            home: const Welcome(),
          ),
        );
        }
        else{
          return const Loading();
        }
      }
    );
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
