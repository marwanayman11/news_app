import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/sports/sports.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen()
  ];
  List<String> titles = ["Business", "Sports", "Science"];
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavBarState());
  }

  void getBusinessData() {
    emit(BusinessStateLoading());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '45dd97d57aa74bb5acf29405985c0747'
    }).then((value) {
      business = value.data['articles'];
      emit(BusinessState());
    }).catchError((error) {
      emit(BusinessStateError(error.toString()));
    });
  }

  void getSportsData() {
    emit(SportsStateLoading());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '45dd97d57aa74bb5acf29405985c0747'
    }).then((value) {
      sports = value.data['articles'];
      emit(SportsState());
    }).catchError((error) {
      emit(SportsStateError(error.toString()));
    });
  }

  void getScienceData() {
    emit(SportsStateLoading());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '45dd97d57aa74bb5acf29405985c0747'
    }).then((value) {
      science = value.data['articles'];
      emit(ScienceState());
    }).catchError((error) {
      print(error.toString());
      emit(ScienceStateError(error.toString()));
    });
  }

  void getSearch(String value) {
    emit(SearchStateLoading());
    DioHelper.getData(
            url: 'v2/everything',
            query: {'q': value, 'apiKey': '45dd97d57aa74bb5acf29405985c0747'})
        .then((value) {
      search = value.data['articles'];

      emit(SearchState());
    }).catchError((error) {
      emit(SearchStateError(error.toString()));
    });
  }

  bool theme = false;

  void changeTheme() {
    theme = !theme;
    CacheHelper.putData(key: 'theme', value: theme).then((value) {
      emit(ChangeThemeState());
    });
  }
}
