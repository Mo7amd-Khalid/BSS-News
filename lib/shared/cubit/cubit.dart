import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import '../../layout/newsLayout.dart';
import '../component/component.dart';
import '../network/local/cache_helper.dart';



class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(InitialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  String lang = CacheHelper.getData(key: 'lang')??"";

  void changeRadioButton(String val){
    lang = val;
    emit(ChangeRadioButtonState());

  }

  void changeRadioButtonFromSetting(String val,BuildContext context ){

    CacheHelper.saveData(key: 'lang', value: val).then((value) {
      lang = val;
      navigateAndFinish(context, Directionality(
          textDirection: AppCubit.get(context).lang == 'eg' ? TextDirection.rtl : TextDirection.ltr, child: NewsLayoutScreen()) );
      NewsAppCubit.get(context).getScienceData(context);
      NewsAppCubit.get(context).getBusinessData(context);
      NewsAppCubit.get(context).getSportData(context);
      emit(ChangeRadioButtonFromSettingState());
    }).catchError((error){print(error.toString());});
  }

  bool isDark = true;

  void changeAppMode({bool? fromShared, required BuildContext context}){

    if(fromShared != null) {
      isDark = CacheHelper.getData(key: 'DarkMode');
      emit(ChangeModeAppState());
    } else
      {
        isDark = !isDark;
        CacheHelper.saveData(key: 'DarkMode', value: isDark).then((value)
        {
          NewsAppCubit.get(context).changeBottomNavLayout(2);
          emit(ChangeModeAppState());
        });
      }


  }

}