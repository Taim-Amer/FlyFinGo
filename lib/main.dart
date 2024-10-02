import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/layout/cubit/tourism_cubit.dart';
import 'package:travelt/screens/email_verify/email_verification_screen.dart';
import 'package:travelt/screens/home/cubit/home_cubit.dart';
import 'package:travelt/screens/home/home_page.dart';
import 'package:travelt/screens/login/login_page.dart';
import 'package:travelt/screens/user/profile_screen.dart';
import 'package:travelt/shared/bloc_observer.dart';
import 'package:travelt/shared/cubit/app_cubit.dart';
import 'package:travelt/shared/network/local/cache_helper.dart';
import 'package:travelt/shared/network/remote/dio_helper.dart';
import 'package:travelt/shared/network/remote/weather_dio_helper.dart';
import 'screens/onboarding/boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );

  Bloc.observer = MyBlocObserver();
  WeatherDioHelper.init();
  DioHelper.init();
  await CacheHelper.init();

  int? theme = CacheHelper.getData(key: "Theme");
  bool? onBoarding = CacheHelper.getData(key: "onBoarding");
  String? token = CacheHelper.getData(key: "token");
  print(token);
  Widget? widget;

  if(onBoarding != null) {
    if(token != null) {
      widget =  HomePage();
    } else {
      widget = LoginPage();
    }
  }else{
    widget = const BoardingScreen();
  }

  runApp(MyApp(
    themeIndex: theme ?? 0,
    startWidget : LoginPage()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.themeIndex, required this.startWidget});

  final int themeIndex ;
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:
        [
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => AppCubit()..changeTheme(themeIndex)),
          BlocProvider(create: (context) => TourismCubit()),
        ],
        child: BlocBuilder<AppCubit , AppState>(
          builder: (context , state){
            return MaterialApp(
              theme: ThemeData(
                fontFamily: 'Ubuntu',
              ),
              debugShowCheckedModeBanner: false,
              home: startWidget,
            );
          },
        ),
    );
  }
}

