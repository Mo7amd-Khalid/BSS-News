import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/home/business/business_screen.dart';
import 'package:news_app/modules/home/home_screen.dart';
import 'package:news_app/modules/home/sports/sport_screen.dart';
import 'package:news_app/modules/home/science/science_screen.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/shared/component/constance.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/style/icon_broken.dart';

class NewsAppCubit extends Cubit<NewsAppStates>
{
  NewsAppCubit() : super(InitialNewsAppState());

  static NewsAppCubit get(context) => BlocProvider.of(context);



  int currentLayoutIndex = 0;

  List<Widget> screensOfLayout = [
    HomeScreen(),
    SearchScreen(),
    SettingsScreen(),
  ];
  List<BottomNavigationBarItem> bottomList = [
    BottomNavigationBarItem(icon: Icon(IconBroken.Home),label: "HOME",),
    BottomNavigationBarItem(icon: Icon(IconBroken.Search),label: "SEARCH",),
    BottomNavigationBarItem(icon: Icon(IconBroken.Setting),label: "FAVOURITE",),
  ];

  void changeBottomNavLayout(int index){
    currentLayoutIndex = index;
    emit(ChangeBottomNavBarLayoutState());
  }


  int currentHomeIndex = 0;

  List<Widget> screensOfHome = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];


  void changeBottomNavHome(int index, BuildContext context){
    currentHomeIndex = index;
    if(currentHomeIndex == 0)
    {
      getBusinessData(context);
    }else if(currentHomeIndex == 1)
      {
        getSportData(context);
      }else
        {
          getScienceData(context);
        }
    emit(ChangeUpNavBarHomeState());
  }

  List<dynamic> businessData = [];
  void getBusinessData(BuildContext context){
    emit(GetBusinessDataLoadingState());
    businessData = [];
    DioHelper.getData(url: url, query: {
      "country":CacheHelper.getData(key: 'lang'),
      "category":"business",
      "apiKey":"f93529a6355f464eab0a974f8fc347d2",
    }).then((value)
    {
      businessData = value.data['articles'];
      emit(GetBusinessDataSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetBusinessDataErrorState());
    });
  }



  List<dynamic> scienceData = [];
  void getScienceData(BuildContext context){
    emit(GetScienceDataLoadingState());
    scienceData = [];
    DioHelper.getData(url: url, query: {
      "country":CacheHelper.getData(key: 'lang'),
      "category":"science",
      "apiKey":"f93529a6355f464eab0a974f8fc347d2",
    }).then((value)
    {
      scienceData = value.data['articles'];
      emit(GetScienceDataSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetScienceDataErrorState());
    });
  }


  List<dynamic> sportData = [];
  void getSportData(BuildContext context){
    emit(GetSportDataLoadingState());
    sportData = [];
    DioHelper.getData(url: url, query: {
      "country":CacheHelper.getData(key: 'lang'),
      "category":"sport",
      "apiKey":"f93529a6355f464eab0a974f8fc347d2",
    }).then((value)
    {
      sportData = value.data['articles'];
      emit(GetSportDataSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetSportDataErrorState());
    });
  }


  List<dynamic> searchData = [];
  void getSearchData({
    required String searchWord
  }){
    emit(GetSearchDataLoadingState());
    searchData = [];
    DioHelper.getData(url: searchUrl, query: {
      "q": searchWord,
      "apiKey":"f93529a6355f464eab0a974f8fc347d2",
    }).then((value)
    {
      searchData = value.data['articles'];
      emit(GetSearchDataSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetSearchDataErrorState());
    });
  }

}