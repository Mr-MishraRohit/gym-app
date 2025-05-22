import 'package:get/get.dart';
import 'package:gym_apps/screens/HomeScreen/home_screen.dart';
import 'package:gym_apps/screens/basicDetailScreen/goals_screen.dart';
import 'package:gym_apps/screens/basicDetailScreen/physical_level_screen.dart';
import 'package:gym_apps/screens/basicDetailScreen/startBasicScreen.dart';
import 'package:gym_apps/screens/basicDetailScreen/weight_screen.dart';

import '../screens/basicDetailScreen/age_screen.dart';
import '../screens/basicDetailScreen/fill_profile_screen.dart';
import '../screens/basicDetailScreen/gender_screen.dart';
import '../screens/basicDetailScreen/height_screen.dart';
import '../screens/loginScreen/forgot_password_screen.dart';
import '../screens/loginScreen/logic_screen.dart';
import '../screens/loginScreen/reset_password_screen.dart';
import '../screens/onBoarding/onboarding_screen.dart';
import '../screens/signUpScreen/signup_screen.dart';
import '../screens/splash/splash_screen.dart';

class RoutesName {
  static const String splashScreen = "/splash-screen";
  static const String onboardingScreen = "/onboarding_screen";
  static const String biometricLoginScreen = "/biometric-login-screen";
  static const String signUpScreen = "/sign-up-screen";
  static const String loginScreen = "/login-screen";
  static const String forgotPasswordScreen = "/forgot-password-screen";
  static const String resetPasswordScreen = "/reset-password-screen";
  static const String homeScreen = "/home-screen";
  static const String startBasicScreen = "/start-basic-screen";
  static const String genderScreen = "/gender-screen";
  static const String ageScreen = "/age-screen";
  static const String weightScreen = "/weight-screen";
  static const String heightScreen = "/height-screen";
  static const String goalsScreen = "/goals-screen";
  static const String physicalScreen = "/physical-screen";
  static const String fillYourProfileScreen = "/fill-your-Profile-screen";
}

final getPages = [
  GetPage(
    name: RoutesName.onboardingScreen,
    page: () => const OnboardingScreen(),
  ),
  GetPage(
    name: RoutesName.splashScreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: RoutesName.signUpScreen,
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: RoutesName.forgotPasswordScreen,
    page: () => const ForgotPasswordScreen(),
  ),
  GetPage(
    name: RoutesName.resetPasswordScreen,
    page: () => const ResetPasswordScreen(),
  ),
  GetPage(
    name: RoutesName.loginScreen,
    page: () {
      return const LogicScreen();
    },
  ),
  GetPage(
    name: RoutesName.startBasicScreen,
    page: () => const StartBasicScreen(),
  ),
  GetPage(
    name: RoutesName.genderScreen,
    page: () => const GenderScreen(),
  ),
  GetPage(
    name: RoutesName.ageScreen,
    page: () => const AgeScreen(),
  ),
  GetPage(
    name: RoutesName.weightScreen,
    page: () => WeightScreen(),
  ),
  GetPage(
    name: RoutesName.heightScreen,
    page: () => HeightScreen(),
  ),
  GetPage(
    name: RoutesName.goalsScreen,
    page: () => GoalsScreen(),
  ),
  GetPage(
    name: RoutesName.physicalScreen,
    page: () => PhysicalLevelScreen(),
  ),
  GetPage(
    name: RoutesName.fillYourProfileScreen,
    page: () => FillProfileScreen(),
  ),
  GetPage(
    name: RoutesName.homeScreen,
    page: () => HomeScreen(),
  ),
];
