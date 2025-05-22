import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gym_apps/routes/routes.dart';
import 'config/color_constant.dart';
import 'config/const.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  _initializeFirebase();
  runApp(const MyApp());
}

Future<void> _initializeFirebase() async {
  try {
    if (Firebase.apps.isNotEmpty) {
      return;
    }
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } on Exception catch (e) {
    if (kDebugMode) {
      Debug.setLog("Firebase initialization error: $e");
    }
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GymZy',
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(0.85)),
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          ),
        );
      },
      initialRoute: RoutesName.splashScreen,
      getPages: getPages,
      theme: ThemeData(
        datePickerTheme: DatePickerThemeData(
          cancelButtonStyle: ButtonStyle(
              foregroundColor:
              WidgetStatePropertyAll(ColorConstant.greenGradient7)),
          confirmButtonStyle: ButtonStyle(
              foregroundColor:
              WidgetStatePropertyAll(ColorConstant.greenGradient7)),
          backgroundColor: ColorConstant.black45,
          // Light Indigo background
          headerBackgroundColor: ColorConstant.greenGradient7,
          // Indigo header
          headerForegroundColor: ColorConstant.black45,
          // White text in header
          dayBackgroundColor: WidgetStateProperty.resolveWith(
                (states) {
              if (states.contains(WidgetState.selected)) {
                return ColorConstant.greenGradient7;
              }
              return ColorConstant.black45;
            },
          ),
          // Dark Indigo for text
          todayBackgroundColor: WidgetStateProperty.resolveWith(
                (states) {
              if (states.contains(WidgetState.selected)) {
                return ColorConstant.greenGradient7;
              }
              return ColorConstant.black45;
            },
          ),
          // Highlight today’s date
          todayForegroundColor: WidgetStateProperty.resolveWith(
                (states) {
              if (states.contains(WidgetState.selected)) {
                return ColorConstant.black45;
              }
              return ColorConstant.greenGradient7;
            },
          ),
        ),
        useMaterial3: false,
        fontFamily: fontFamilyString,
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith(
                (states) {
              if (states.contains(WidgetState.selected)) {
                return ColorConstant.greenGradient7;
              }
              return ColorConstant.black45;
            },
          ),
        ),
        appBarTheme: AppBarTheme(
          shape: OutlineInputBorder(
              borderSide:
              BorderSide(color: ColorConstant.greenGradient8, width: 1),
              borderRadius: BorderRadius.circular(0)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          // Default background color
          iconTheme: IconThemeData(color: Colors.blue, size: 20),
          // Default icon color
          titleTextStyle: TextStyle(
              color: ColorConstant.black45,
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.bold,
              fontFamily: fontFamilyString),
          toolbarTextStyle: TextStyle(
            color: Colors.blue,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}