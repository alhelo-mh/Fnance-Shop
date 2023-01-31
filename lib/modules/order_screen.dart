import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_application/modules/my_order_screen.dart';
import 'package:shop_application/shared/components/components.dart';

import '../layout/cubit/cubit.dart';
import '../layout/cubit/statas.dart';
import '../models/shop_app/cart_model.dart';
import 'cart_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

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
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: Image.asset(
                        'assets/images/sound.png',
                        width: 45,
                      )),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: const Text(
                      'Delivery Adderss',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    height: 320,
                    width: 370.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300]!,
                            blurStyle: BlurStyle.outer,
                            blurRadius: 10),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border(
                        top: BorderSide(width: 1, color: Colors.grey[200]!),
                        bottom: BorderSide(width: 1, color: Colors.grey[200]!),
                        right: BorderSide(width: 1, color: Colors.grey[200]!),
                        left: BorderSide(width: 1, color: Colors.grey[200]!),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Street: ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                '3512 Nazaz Street ',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                'City: ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'Gaza ',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                'State/Province/area: ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'TAmil Nadu ',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                'Zip code: ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                '95814 ',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                'Country calling code : ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                '+970 ',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                'Country: ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'GAZA ',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                'Street: ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                '3512 Nazaz Street ',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: const Text(
                        'Product Item',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      )),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        ShopCubit.get(context).carts!.data!.cartItems!.length,
                    itemBuilder: (context, index) {
                      return listBalider(ShopCubit.get(context)
                          .carts!
                          .data!
                          .cartItems![index]
                          .product!);
                    },
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total Pnice',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              '\$ ${ShopCubit.get(context).carts!.data!.subTotal.toString()}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            navigateTO(context, MyOrderScreen());
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
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
                                    'Place Order',
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
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Widget listBalider(Product model) {
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
                  '% ${(model.price! / model.oldPrice!) * 100}',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.white,
                  ),
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
