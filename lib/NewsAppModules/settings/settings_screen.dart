import 'package:flutter/material.dart';
import 'package:news_app2/NewsAppModules/newsApp/news_cubit/NewsCubit.dart';
import 'package:news_app2/network/local/shared_prefrence.dart';

class settingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dark = NewsAppCubit.get(context).isDark;
    //var mode=NewsAppCubit.get(context).NowMode;
    var cubit = NewsAppCubit.get(context);

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Dark Mode',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
        Switch(
          value: dark,
          onChanged: (bool value) {
            dark = !dark;
            NewsAppCubit.get(context).changeMode();
            CasheHelper.setBoolean(key: 'isDark', value: NewsAppCubit.get(context).isDark);
          },
          inactiveThumbColor: Colors.green,
          inactiveTrackColor: Colors.white,
          activeColor: Colors.teal,
        ),
      ],
    );
  }
}
