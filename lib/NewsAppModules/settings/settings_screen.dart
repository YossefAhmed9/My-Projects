import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newzak/NewsAppModules/newsApp/news_cubit/states.dart';

import '../../network/local/shared_prefrence.dart';
import '../newsApp/news_cubit/NewsCubit.dart';

class settingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dark = NewsAppCubit.get(context).isDark;
    var cubit = NewsAppCubit.get(context);

    return BlocConsumer<NewsAppCubit, NewsAppStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
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
  },
);
  }
}
