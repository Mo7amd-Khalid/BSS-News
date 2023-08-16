import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/component/constance.dart';
import 'package:news_app/shared/cubit/cubit.dart';

import '../shared/style/icon_broken.dart';

class NewsLayoutScreen extends StatelessWidget {
  const NewsLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Row(
              textDirection: AppCubit.get(context).lang == 'eg' ? TextDirection.rtl : TextDirection.ltr,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: defaultColor,
                      width: 4
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: defaultColor
                  ),
                  child: const Text(
                    "BSS",
                    style: TextStyle(
                      fontFamily: "Jannah",
                      color: Colors.white
                    ),
                  ),
                ),
                const Text(
                  " News",
                  style: TextStyle(
                    fontFamily: "Jannah"
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(IconBroken.Home),label: "HOME",
                  backgroundColor: AppCubit.get(context).isDark? Colors.black: Colors.white),
              BottomNavigationBarItem(icon: Icon(IconBroken.Search),label: "SEARCH",
                  backgroundColor: AppCubit.get(context).isDark? Colors.black: Colors.white),
              BottomNavigationBarItem(icon: Icon(IconBroken.Setting),label: "FAVOURITE",
                  backgroundColor: AppCubit.get(context).isDark? Colors.black: Colors.white),
            ],
            unselectedItemColor: Colors.grey,
            selectedItemColor: defaultColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.shifting,
            onTap: (int index){
              cubit.changeBottomNavLayout(index);
            },
            currentIndex: cubit.currentLayoutIndex,

          ),
          body:Directionality(textDirection:AppCubit.get(context).lang == 'eg' ? TextDirection.rtl : TextDirection.ltr ,child: cubit.screensOfLayout[cubit.currentLayoutIndex],) ,
        );
      },
    );
  }
}
