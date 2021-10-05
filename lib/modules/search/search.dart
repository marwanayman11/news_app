import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
 final searchController = TextEditingController();

  SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).search;

          return Scaffold(
              appBar: AppBar(),
              body: Column(mainAxisSize: MainAxisSize.max, children: [
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: defaultForm(
                        controller: searchController,
                        type: TextInputType.text,
                        label: "Search",
                        prefix: Icons.search,
                        onChange: ( String value) {
                          NewsCubit.get(context).getSearch(value);
                          if(value.isEmpty)NewsCubit.get(context).search=[];
                        },
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "Search must not be empty";
                          }
                          return null;
                        })),
                Expanded(
                  child: Stack(
                    children: [
                      newsView(
                          n: list, context: context, i: list.length),
                      if (state is SearchStateLoading)
                        const Center(child: CircularProgressIndicator())
                    ],
                  ),
                )
              ]));
        });
  }
}
