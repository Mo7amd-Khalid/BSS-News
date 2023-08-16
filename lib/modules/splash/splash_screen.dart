import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/layout/newsLayout.dart';
import 'package:news_app/modules/select_lang/select_lang_screen.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:news_app/shared/component/constance.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? _timer;

  _startSplash(){
    _timer = Timer(Duration(seconds: 2), _goNext);
  }

  _goNext(){
    print(CacheHelper.getData(key: 'selectedLang'));
    if(CacheHelper.getData(key: 'selectedLang') == null)
      {
        navigateAndFinish(context, Directionality(
            textDirection: AppCubit.get(context).lang == 'eg' ? TextDirection.rtl : TextDirection.ltr, child: SelectLangScreen()));
      }else
        {
          navigateAndFinish(context, Directionality(
              textDirection: AppCubit.get(context).lang == 'eg' ? TextDirection.rtl : TextDirection.ltr, child: NewsLayoutScreen()) );
        }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startSplash();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
                  color: Colors.white,
                fontSize: 32
              ),
            ),
          ),
          Text(
            " News",
            style: TextStyle(
                fontFamily: "Jannah",
              fontSize: 30,
              color: AppCubit.get(context).isDark ? Colors.white : Colors.black
            ),
          ),
        ],
      )),
    );
  }
}
