import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/component/constance.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: SalomonBottomBar(
              backgroundColor: AppCubit.get(context).isDark? Colors.black: Colors.white,
              curve: Curves.decelerate,
              currentIndex: cubit.currentHomeIndex,
              unselectedItemColor: Colors.grey,
              selectedItemColor: defaultColor,
              onTap: (index){
                cubit.changeBottomNavHome(index, context);
              },
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(Icons.business),
                  title: Text(AppCubit.get(context).lang == 'eg' ? "الاعمال" : "Business"), ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.sports),
                  title: Text(AppCubit.get(context).lang == 'eg' ? "الرياضة" : "Sports"), ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.science_outlined),
                  title: Text(AppCubit.get(context).lang == 'eg' ? "العلوم" : "Science"), ),
              ],
            ),
          ),
          body: Directionality(textDirection:AppCubit.get(context).lang == 'eg' ? TextDirection.rtl : TextDirection.ltr ,child: cubit.screensOfHome[cubit.currentHomeIndex],),
        );
      },
    );
  }
}
