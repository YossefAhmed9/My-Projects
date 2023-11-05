import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../NewsAppModules/newsApp/news_cubit/NewsCubit.dart';
import '../NewsAppModules/newsApp/news_cubit/states.dart';
import '../NewsAppModules/search/search_screen.dart';

class NewsLayout extends StatelessWidget {
  NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsAppCubit.get(context);
          //ThemeMode trigger = NewsAppCubit.get(context).mode;
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  },
                  icon: Icon(Icons.search),
                  iconSize: 30,
                ),
              ],
              systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarIconBrightness: Brightness.dark,
                statusBarColor: NewsAppCubit.get(context).isDark
                    ? Colors.white
                    : Colors.black,
                statusBarIconBrightness: NewsAppCubit.get(context).isDark
                    ? Brightness.dark
                    : Brightness.light,
              ),
              elevation: 0,
              title: Text(
                'News app',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            body: NewsAppCubit.get(context).screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 15,
              selectedItemColor: Colors.purpleAccent,
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business_center), label: 'Business'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports_baseball), label: 'Sport'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.four_g_plus_mobiledata), label: 'Tech'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ],
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
          );
        });
  }
}
