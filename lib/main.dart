import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/styles/themes.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'NewsAppModules/newsApp/news_cubit/NewsCubit.dart';
import 'NewsAppModules/newsApp/news_cubit/states.dart';
import 'layouts/newsApp_layout.dart';
import 'network/local/shared_prefrence.dart';
import 'network/remote/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer;
  DioHelper.init();
  await CasheHelper.init();
  //var isDark = CasheHelper.getBoolean(key: "isDark");
  runApp(MyApp());
  if (Platform.isAndroid) WebView.platform = AndroidWebView();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsAppCubit(),
        ),
        // BlocProvider(create:(BuildContext context) => NewsAppCubit()),
        BlocProvider(
          create: (BuildContext context) => NewsAppCubit()
            ..businessData()
            ..SportData()
            ..TechData()
            ..changeMode(),
        ),
      ],
      child: BlocConsumer<NewsAppCubit, NewsAppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              themeMode: NewsAppCubit.get(context).isDark
                  ? ThemeMode.light
                  : ThemeMode.dark,
              home: NewsLayout(),
              theme: lightTheme,
              debugShowCheckedModeBanner: false,
              //Dark Mode
              darkTheme: darkTheme,
            );
          }),
    );
  }
}
