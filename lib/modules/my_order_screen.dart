import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_application/layout/cubit/cubit.dart';
import 'package:shop_application/layout/cubit/statas.dart';
import 'package:shop_application/layout/shop_layout.dart';
import 'package:shop_application/modules/products/home_product.dart';
import 'package:shop_application/shared/components/components.dart';

import '../models/shop_app/cart_model.dart';
import 'order_screen.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              elevation: 0,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Image.asset(
                      'assets/images/sound.png',
                      width: 45,
                    )),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: const Text(
                    'My Order',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      ShopCubit.get(context).carts!.data!.cartItems!.length,
                  itemBuilder: (context, index) {
                    return orderBalider(ShopCubit.get(context)
                        .carts!
                        .data!
                        .cartItems![index]
                        .product!);
                  },
                ),
                InkWell(
                  onTap: () {
                    navigateTO(context, ShopLayout());
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 40),
                    width: 180.w,
                    height: 46.h,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Got to home',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

Widget orderBalider(Product model) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    height: 88.h,
    width: 370.w,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          color: Colors.grey[300]!, blurStyle: BlurStyle.outer, blurRadius: 10),
    ], borderRadius: BorderRadius.circular(20), color: Colors.white),
    child: Row(
      children: [
        Stack(
          children: [
            // if (model.discount != 0)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 75.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(model.image ?? ''), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
        Container(
          width: 200,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
              ),
              Text(
                model.description!,
                maxLines: 1,
                style: const TextStyle(fontSize: 12, color: Colors.black38),
              ),
              const Spacer(),
              Text('\$ ${model.price}')
            ],
          ),
        ),
      ],
    ),
  );
}
