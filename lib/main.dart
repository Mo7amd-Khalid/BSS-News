import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/modules/splash/splash_screen.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/style/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  bool? isDark = CacheHelper.getData(key: 'DarkMode');

  runApp(MyApp(isDark: isDark,));
}

class MyApp extends StatelessWidget {

  final bool? isDark;

  MyApp({
    required this.isDark
});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()..changeAppMode(fromShared: isDark, context: context),),
        BlocProvider(
          create: (BuildContext context) => NewsAppCubit()..getScienceData(context)..getSportData(context)..getBusinessData(context),),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: Directionality(
              textDirection: AppCubit.get(context).lang == 'eg' ? TextDirection.rtl : TextDirection.ltr,
              child: SplashScreen(),
            ) ,
          );
        },
      ),
    );
  }
}
