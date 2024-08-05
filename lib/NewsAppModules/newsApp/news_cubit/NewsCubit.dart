import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newzak/NewsAppModules/newsApp/news_cubit/states.dart';

import '../../../network/local/shared_prefrence.dart';
import '../../../network/remote/dio_helper.dart';
import '../../business/Business_screen.dart';
import '../../settings/settings_screen.dart';
import '../../sport/Sport_screen.dart';
import '../../tech/Tech_screen.dart';
import 'package:intl/intl.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super(NewsAppInitialState());

  static NewsAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = CasheHelper.getBoolean(key: 'index') ?? 0;
  String formattedDate = DateFormat.yMMMEd().format(DateTime.now());

  List<Widget> screen = [
    LatestNewsScreen(),
    BusinessScreen(),

    TechScreen(),
    settingsScreen()
  ];

  List<String> titles = ['Latest', 'Business', 'Tech', 'Settings'];

  void changeIndex(int index) {
    currentIndex = index;
    CasheHelper.getBoolean(key: '${currentIndex}');

    CasheHelper.setBoolean(key: 'index', value: currentIndex).then((value) {
      emit(NewsAppChangeBottomNavBar());
    });

    emit(NewsAppChangeBottomNavBar());
  }

  //ThemeMode Mode=ThemeMode.dark;

// https://newsapi.org
// /v2/top-headlines?
// country=us
// &apiKey=c2fd52d2a9394fa19402f056d1b2dc21
  List<dynamic> business = [];

  businessData() {
    // https://newsapi.org
    // /v2/top-headlines?
    // country=us
    // &category=business
    // &apiKey=c2fd52d2a9394fa19402f056d1b2dc21
    emit(GetBusinessLoadingState());
    return DioHelper.getDioData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': 'eac516a81a1d43d4bbb1293bdd20dd24'
    }).then((value) {
      //print('${value.data['articles'][1]['title']}');
      business = value.data['articles'];
      emit(GetBusinessSuccessState());
    }).catchError((error) {
      emit(GetBusinessErrorState(error));
      print(error.runtimeType);
      print(error.toString());
    });
  }

  List<dynamic> latest = [];

  latestData() {

   //https://newsapi.org/
    // v2/everything?
    // domains=wsj.com
    // &apiKey=eac516a81a1d43d4bbb1293bdd20dd24
    emit(SportLoadingState());
    return DioHelper.getDioData(url: 'v2/everything', query: {
      'domains': 'wsj.com',
      'from': '2023-05-12',
      'apiKey': 'eac516a81a1d43d4bbb1293bdd20dd24'
    }).then((value) {
      //print('${value.data['articles'][1]['title']}');
      latest = value.data['articles'];
      emit(SportSuccessState());
    }).catchError((error) {
      emit(SportErrorState(error));
      print(error.runtimeType);
      print(error.toString());
    });
  }

  List<dynamic> tech = [];

  TechData() {
    // https://newsapi.org/
    // v2/top-headlines?
    // sources=techcrunch&
    // apiKey=eac516a81a1d43d4bbb1293bdd20dd24
    emit(TechLoadingState());
    return DioHelper.getDioData(url: 'v2/top-headlines', query: {
      'sources': 'techcrunch',
      'apiKey': 'eac516a81a1d43d4bbb1293bdd20dd24'
    }).then((value) {
      //print('${value.data['articles'][1]['title']}');
      tech = value.data['articles'];
      emit(TechSuccessState());
    }).catchError((error) {
      emit(TechErrorState(error));
      print(error.runtimeType);
      print(error.toString());
    });
  }

  bool isDark = false;

  // ThemeMode NowMode= isDark ? ThemeMode.light : ThemeMode.dark;

  changeMode() {
    isDark = !isDark;
    //print('this is${isDark}');
    CasheHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
      print('This is isDark ${CasheHelper.getBoolean(key: 'isDark')}');
      emit(ChangeModeState());
    });
  }

  List<dynamic> search = [];

  SearchData(searchValue) async {
    //https://newsapi.org/
    // v2/everything?domains=wsj.com&apiKey=eac516a81a1d43d4bbb1293bdd20dd24
    emit(SearchLoadingState());
    return await DioHelper.getDioData(url: 'v2/everything ', query: {
      'q': '$searchValue',
      'apiKey': 'eac516a81a1d43d4bbb1293bdd20dd24'
    }).then((value) {
      //print('${value.data['articles'][1]['title']}');
      search = value.data['articles'];
      emit(SearchSuccessState());
    }).catchError((error) {
      emit(SearchErrorState(error));
      print(error.runtimeType);
      print(error.toString());
    });
  }
}
