import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<NewsCubit,NewsStates>(
        builder:(context,state){
          var list = NewsCubit.get(context).science;
          if (state is ScienceStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return newsView(n: list,context: context,i:list.length);
          }},

        listener:(context,state){});

  }
}