import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search/search.dart';
import 'package:news_app/shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: () {
                pushTo(context, SearchScreen());
              },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {

                    NewsCubit.get(context).changeTheme();

                  },
                  icon: const Icon(Icons.brightness_4_outlined))
            ],
            title: Row(
              //mainAxisAlignment:MainAxisAlignment.center ,
              children: const [
                Text("M11|News "),
                Icon(Icons.fiber_new_sharp)
              ],
            ),
            //centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeIndex(value);

            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
      listener: (context, state) {},
    );
  }
}
