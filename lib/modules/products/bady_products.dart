import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_application/layout/cubit/cubit.dart';


import '../../models/shop_app/home_model.dart';

class BadyProducts extends StatelessWidget {
  ProductModel model;
  BadyProducts(this.model);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 176.h,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Container(
                    height: 163.h,
                    width: 163.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(model.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  // Required some widget in between to float AppBar
                  Container(),
                  Positioned(
                      top: 144.h,
                      left: 120.w,
                      child: IconButton(
                          onPressed: () {
                            ShopCubit.get(context).changeFavorites(model.id);
                          },
                          icon: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: Icon(
                              ShopCubit.get(context).favorites[model.id]!
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              size: 25,
                              color: ShopCubit.get(context).favorites[model.id]!
                                  ? const Color.fromRGBO(231, 185, 68, 100)
                                  : const Color.fromARGB(255, 132, 95, 161),
                            ),
                          ))),
                  if (model.discount != 0)
                    Container(
                      width: 47.w,
                      height: 20.h,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        ' -50%',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.white,
                        ),
                      ),
                    )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, height: 1.3),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${model.price.round()}',
                        style: const TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (model.discount != 0)
                        Text(
                          '\$${model.old_price.round()}',
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(52, 40, 62, 100),
                              decoration: TextDecoration.lineThrough),
                        ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
