import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/newsLayout.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:news_app/shared/component/constance.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class SelectLangScreen extends StatelessWidget {
  const SelectLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              textDirection: AppCubit.get(context).lang == 'eg' ? TextDirection.rtl : TextDirection.ltr,
              children:
              [
                Text(
                  AppCubit.get(context).lang == 'eg' ? "اختار اللغة" : "Choose the language",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                RadioListTile(
                  title: Text(AppCubit.get(context).lang == 'eg' ? "الانجليزية" : "English"),
                  value: "us",
                  groupValue: cubit.lang,
                  onChanged: (value){
                    cubit.changeRadioButton(value!);
                    print(cubit.lang);
                  },
                  activeColor: defaultColor,
                ),
                RadioListTile(
                  title: Text(AppCubit.get(context).lang == 'eg' ? "العربية" : "Arabic"),
                  value: "eg",
                  groupValue: cubit.lang,
                  onChanged: (value){
                    cubit.changeRadioButton(value!);
                    print(cubit.lang);
                  },
                  activeColor: defaultColor,
                ),
                Spacer(),
                if(cubit.lang.isNotEmpty)
                  MyDefaultButton(
                      onPressed: (){
                        CacheHelper.saveData(key: 'selectedLang', value: true).then((value) {
                          CacheHelper.saveData(key: 'lang', value: cubit.lang).then((value) {
                            NewsAppCubit.get(context).getScienceData(context);
                            NewsAppCubit.get(context).getBusinessData(context);
                            NewsAppCubit.get(context).getSportData(context);
                            navigateAndFinish(context, Directionality(
                                textDirection: AppCubit.get(context).lang == 'eg' ? TextDirection.rtl : TextDirection.ltr, child: NewsLayoutScreen()));
                          }).catchError((error){print(error.toString());});
                        }).catchError((error){print(error.toString());});
                      },
                    color: defaultColor,
                    labelOfButton: Text(
                        AppCubit.get(context).lang == 'eg' ? "التالي" : "Next"
                    ),
                    height: 40,
                    radius: 20
                  ),

              ],
            ),
          ),
        );
      },
    );
  }
}
