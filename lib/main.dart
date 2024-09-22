import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_project/home/cart/cubit/cart_screen_view_model.dart';
import 'package:route_project/home/cart/widget/cart_screen.dart';
import 'package:route_project/home_screen/home_screen_view.dart';
import 'package:route_project/splash/splash_screen.dart';
import 'package:route_project/tabs/home_tab/product_list/cubit/product_view_model.dart';
import 'package:route_project/tabs/home_tab/product_list/product_details_view.dart';
import 'package:route_project/tabs/profile_screen.dart';
import 'package:route_project/utils/shared_preference.dart';

import 'auth/register/sign_up.dart';
import 'foot_wear.dart';
import 'home/login_screen.dart';
import 'my_bloc_observer.dart';
import 'my_theme.dart';
import 'tabs/home_tab/widgets/homee.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPreferenceUtils.init();
  var token = SharedPreferenceUtils.getData(key: 'token');
  String route;

  if (token == null) {
    route = LoginScreen.routeName;
  } else {
    route = Homee.routeName;
  }

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => CartScreenViewModel()),
      //BlocProvider(
      //create: (context) => WishListCubit(),
      //),
      BlocProvider(create: (context) => ProductViewModel())
    ],
    child: MyApp(route: route),
  ));
}

class MyApp extends StatelessWidget {
  String route;

  MyApp({required this.route});

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
              initialRoute: route,
              routes: {
                SplashScreen.routeName: (context) => SplashScreen(),
                ProfileScreen.routeName: (context) => ProfileScreen(),
                HomeScreenView.routeName: (context) => HomeScreenView(),

                LoginScreen.routeName: (context) => LoginScreen(),
                SignUp.routeName: (context) => SignUp(),
                // Add the sign-up route
                Homee.routeName: (context) => Homee(),
                ProductDetailsView.routeName: (context) => ProductDetailsView(),
                CartScreen.routeName: (context) => CartScreen(),

                // Add the sign-up route
                FootWear.routeName: (context) => FootWear(),
                // Add the sign-up route
              },
              theme: MyTheme.mainTheme);
        });
  }
}
