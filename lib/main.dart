import 'package:e_commerce_app/ui/auth/login/login_screen.dart';
import 'package:e_commerce_app/ui/auth/register/register_screen.dart';
import 'package:e_commerce_app/ui/home/cart/cart_screen.dart';
import 'package:e_commerce_app/ui/home/home_screen/home_screen_view.dart';
import 'package:e_commerce_app/ui/home/product_details/product_details_view.dart';
import 'package:e_commerce_app/ui/splash/splash_screen.dart';
import 'package:e_commerce_app/ui/utils/app_theme.dart';
import 'package:e_commerce_app/ui/utils/my_bloc_observer.dart';
import 'package:e_commerce_app/ui/utils/shared_preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await SharedPreferenceUtils.init();
 var user  = SharedPreferenceUtils.getData(key: 'Token');
  Bloc.observer =MyBlocObserver();
  String route;
  if(user==null){
    route = LoginScreen.routeName;
  }else{
    route = HomeScreenView.routeName;
  }
  runApp( MyApp(
    route: route,

  ));
}
class MyApp extends StatelessWidget {
  String route;
  MyApp({required this.route});
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute:route ,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              HomeScreenView.routeName: (context) => HomeScreenView(),
              ProductDetailsView.routeName: (context) => ProductDetailsView(),
              CartScreen.routeName: (context) => CartScreen(),
            },
            theme: AppTheme.mainTheme,
          );
        });
  }
}
