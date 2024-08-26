import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app_route/home/view/category_screen.dart';
import 'package:new_app_route/home/view/home_screen.dart';
import 'package:new_app_route/home/view/splash_screen.dart';
import 'package:new_app_route/home/view_model/home_cubit.dart';
import 'package:new_app_route/my_bloc_observer.dart';

void main() async{

  Bloc.observer = MyBlocObserver();


  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => HomeCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
            SplashScreen.routeName: (context) => const SplashScreen(),
            CategoryScreen.routeName:(context)=> const CategoryScreen(),

          },
          initialRoute: CategoryScreen.routeName,
        ),
      ),
    );
  }
}


