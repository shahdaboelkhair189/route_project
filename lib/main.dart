import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_project/splash/splash_screen.dart';

import 'auth/register/sign_up.dart';
import 'foot_wear.dart';
import 'home/home_screen.dart';
import 'home/homee.dart';
import 'my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: SplashScreen.routeName,
              routes: {
                SplashScreen.routeName: (context) => SplashScreen(),
                HomeScreen.routeName: (context) => HomeScreen(),
                SignUp.routeName: (context) => SignUp(),
                // Add the sign-up route
                Homee.routeName: (context) => Homee(),
                // Add the sign-up route
                FootWear.routeName: (context) => FootWear(),
                // Add the sign-up route
              },
              theme: MyTheme.mainTheme);
        });
  }
}
