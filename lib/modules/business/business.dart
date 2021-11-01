import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<NewsCubit,NewsStates>(
        builder:(context,state){
          var list = NewsCubit.get(context).business;
          if(state is BusinessStateLoading) { return const Center(child: CircularProgressIndicator());}
          return ScreenTypeLayout(
            mobile:Builder(
                builder:(context){
                  NewsCubit.get(context).desktop(false);
              return newsView(n: list,context: context,i: list.length);}),
            desktop: Builder(
              builder: (context) {
                NewsCubit.get(context).desktop(true);
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: newsView(n: list,context: context,i: list.length)),
                    if(list.length>0)
                    Expanded(child: Container(height: double.infinity,child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('${list[NewsCubit.get(context).selected]['description']}',style: TextStyle(color: Colors.white),),
                    ),color: Colors.blue,))
                  ],
                );
              }
            ),
            breakpoints:ScreenBreakpoints(desktop: 600, tablet: 300, watch: 100),
          );},

        listener:(context,state){});
  }
}
