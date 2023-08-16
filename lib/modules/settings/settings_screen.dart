import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/constance.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            textDirection: cubit.lang == 'eg' ? TextDirection.rtl : TextDirection.ltr,
            children:
            [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20)
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children:
                    [
                      Text(
                        cubit.lang == 'eg' ? "الوضع الليلي" : "Dark Mode",
                        style: TextStyle(
                          fontFamily: "Jannah",
                          color: Colors.black,
                          fontSize: 26
                        ),
                      ),
                      const Spacer(),
                      Switch(
                          value: cubit.isDark,
                          activeColor: defaultColor,
                          onChanged: (value){
                        cubit.changeAppMode(context: context);
                      }),

                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20)
                ),
                width: double.infinity,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Text(
                        cubit.lang == 'eg' ? "اللغة" : "Language",
                        style: const TextStyle(
                            fontFamily: "Jannah",
                            color: Colors.black,
                            fontSize: 26
                        ),
                      ),
                      RadioListTile(
                        title: Text(cubit.lang == 'eg' ? "الانجليزية" : "English"),
                        value: "us",
                        groupValue: cubit.lang,
                        onChanged: (value){
                          cubit.changeRadioButtonFromSetting(value.toString(), context);
                        },
                        activeColor: defaultColor,
                      ),
                      RadioListTile(
                        title: Text(cubit.lang == 'eg' ? "العربية" : "Arabic"),
                        value: "eg",
                        groupValue: cubit.lang,
                        onChanged: (value){
                          cubit.changeRadioButtonFromSetting(value.toString(), context);
                        },
                        activeColor: defaultColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
