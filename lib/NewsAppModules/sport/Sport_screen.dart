import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:dio/dio.dart';

import '../../components/components.dart';
import '../newsApp/news_cubit/NewsCubit.dart';
import '../newsApp/news_cubit/states.dart';

class LatestNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsAppCubit cubit = NewsAppCubit.get(context);
        return ConditionalBuilder(
            condition: true,
            builder: (context) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    NewReport(NewsAppCubit.get(context).latest[index], context),
                separatorBuilder: (context, index) => separate(),
                itemCount: NewsAppCubit.get(context).latest.length,
              );
            },
            fallback: (context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            });
      },
    );
  }
}
