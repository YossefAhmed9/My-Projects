import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../newsApp/news_cubit/NewsCubit.dart';
import '../newsApp/news_cubit/states.dart';

class TechScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state){},

      builder: (context, state){
        return BlocConsumer<NewsAppCubit, NewsAppStates>(
          builder: (context, state) {
            return ConditionalBuilder(
                condition: state is! TechLoadingState,
                builder: (context) => ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => NewReport(NewsAppCubit.get(context).tech[index],context),
                  separatorBuilder: (context, index) => separate(),
                  itemCount: NewsAppCubit.get(context).tech.length,
                ),
                fallback: (context) => const Center(child: CircularProgressIndicator()));
          },
          listener: (context, state) {},
        );

      },


    );
  }

}