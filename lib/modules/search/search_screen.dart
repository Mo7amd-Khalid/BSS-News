import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:news_app/shared/component/constance.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsAppCubit.get(context);

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: myTextFormField(
                  direction: AppCubit.get(context).lang == 'eg' ?  TextDirection.rtl : TextDirection.ltr,
                  controller: searchController,
                  keyboard: TextInputType.text,
                  label: Text(AppCubit.get(context).lang == 'eg' ? "بحث" : "Search",
                    style: TextStyle(
                        color: Colors.grey[600]
                    ),
                  ),
                  prefix: Icons.search_outlined,
                  changeFunc: (String s){
                    if(s.isEmpty)
                    {
                      cubit.getSearchData(searchWord: "");
                    }
                    else
                    {
                      cubit.getSearchData(searchWord: s);
                    }
                  },
                  outLineBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                textColor: AppCubit.get(context).isDark? Colors.white: Colors.black
              ),
            ),
            Expanded(
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => itemBuilder(context, cubit.searchData[index]),
                  separatorBuilder: (context, index) => SizedBox(height: 0,),
                  itemCount: cubit.searchData.length),
            )
          ],
        );
      },
    );
  }
}

