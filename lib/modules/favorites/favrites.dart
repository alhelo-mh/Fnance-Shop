import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_application/layout/cubit/cubit.dart';
import 'package:shop_application/layout/cubit/statas.dart';

import 'package:shop_application/shared/components/components.dart';


class FavritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          fallback: (context) => const Center(child: CircularProgressIndicator()),
          condition: state is! ShopLoadingGetFavoritesState,
          builder: (context) => ScreenUtilInit(
            builder: (BuildContext context, Widget? child) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.h,
                    crossAxisSpacing: 5.w,
                    childAspectRatio: 1 / 1.75.r,
                    children: List.generate(
                      ShopCubit.get(context).favoritsModel!.data!.data!.length,
                      (index) => buildGridProduct(
                          ShopCubit.get(context)
                              .favoritsModel!
                              .data!
                              .data![index]
                              .product!,
                          context),
                    )),
              );
            },
          ),

          //
          // ListView.separated(
          //     itemBuilder: (context, index) => buildGridProduct(
          //         ShopCubit.get(context)
          //             .favoritsModel!
          //             .data!
          //             .data![index]
          //             .product!,
          //         context),
          //     separatorBuilder: (context, index) => myDivider(),
          //     itemCount:
          //         ShopCubit.get(context).favoritsModel!.data!.data!.length),
        );
      },
    );
  }
}
