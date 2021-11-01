import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/newsapp_layout.dart';
import 'package:news_app/shared/network/local/bloc_observer.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/network/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'layout/cubit/cubit.dart';
import 'layout/cubit/states.dart';
import 'package:desktop_window/desktop_window.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   // if(Platform.isLinux)
   //   await DesktopWindow.setMinWindowSize(Size(350,650));
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  if (CacheHelper.getData(key: 'theme') == null) {
    CacheHelper.saveData(key: 'theme', value: false);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()..changeTheme(),
        ),
        BlocProvider(
            create: (BuildContext context) => NewsCubit()
              ..getBusinessData()
              ..getScienceData()
              ..getSportsData())
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          return MaterialApp(
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: CacheHelper.getData(key: 'theme')
                  ? ThemeMode.dark
                  : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              home: NewsLayout());
        },
        listener: (context, state) {},
      ),
    );
  }
}
