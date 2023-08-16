import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/component/component.dart';
import '../../../shared/component/constance.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsAppCubit.get(context);
        return ConditionalBuilder(
            condition: cubit.businessData.isNotEmpty,
            builder: (context) => ListView.separated(
              shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => itemBuilder(context, cubit.businessData[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 0,),
                itemCount: cubit.businessData.length,),
            fallback: (context) => Center(
              child: CircularProgressIndicator(color: defaultColor,),));
      },
    );
  }
}
