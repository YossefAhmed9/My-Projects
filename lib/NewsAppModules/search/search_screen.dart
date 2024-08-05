import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/components.dart';
import '../newsApp/news_cubit/NewsCubit.dart';
import '../newsApp/news_cubit/states.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: defaultTextFormField(
                      TextInputType.text,
                      searchController,
                      (value) {
                        //value = searchController.toString();
                      },
                      (value) {
                        //change

                        NewsAppCubit.get(context)
                            .SearchData(searchController.toString());
                        print(value);
                      },
                      () {},
                      'Search',
                      Icon(Icons.search),
                      (value) {
                        if (value!.isEmpty) {
                          return 'You must enter data';
                        }
                      })),
            ),
            BlocConsumer<NewsAppCubit, NewsAppStates>(
              builder: (context, state) {
                var list = NewsAppCubit.get(context).search;
                return ConditionalBuilder(
                    condition: NewsAppCubit.get(context).search.length > 0,
                    //Add yours here
                    builder: (context) => SizedBox(
                          height: 600,
                          width: double.infinity,
                          child: ListView.separated(
                            // physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                NewReport(list, context),
                            separatorBuilder: (context, index) => separate(),
                            itemCount: 2,
                          ),
                        ),
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()));
              },
              listener: (context, state) {},
            ),
          ],
        ),
    );
  },
);
  }
}
