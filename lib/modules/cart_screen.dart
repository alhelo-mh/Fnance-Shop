import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_application/layout/cubit/cubit.dart';
import 'package:shop_application/modules/order_screen.dart';

import '../models/shop_app/cart_model.dart';
import '../shared/components/components.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          toolbarHeight: 61.h,
          title: InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/images/sound.png',
              width: 35.w,
            ),
          ),
          actions: [
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white12,
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                      ),
                    ),
                    CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.black,
                        child: Text(
                          ShopCubit.get(context)
                              .carts!
                              .data!
                              .cartItems!
                              .length
                              .toString(),
                          style: TextStyle(fontSize: 10),
                        )),
                  ],
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Text(
                    'My Cart',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  )),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                    ShopCubit.get(context).carts!.data!.cartItems!.length,
                itemBuilder: (context, index) {
                  return columnBalider(
                      ShopCubit.get(context)
                          .carts!
                          .data!
                          .cartItems![index]
                          .product!,
                      context);
                },
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                height: 200,
                width: 350.w,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300]!,
                        blurStyle: BlurStyle.outer,
                        blurRadius: 10),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    top: BorderSide(width: 1, color: Colors.grey[200]!),
                    bottom: BorderSide(width: 1, color: Colors.grey[200]!),
                    right: BorderSide(width: 1, color: Colors.grey[200]!),
                    left: BorderSide(width: 1, color: Colors.grey[200]!),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Subtotal: ',
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Text(
                                ShopCubit.get(context)
                                    .carts!
                                    .data!
                                    .subTotal
                                    .toString(),
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Text(
                                'item : ',
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Text(
                                ShopCubit.get(context)
                                    .carts!
                                    .data!
                                    .cartItems!
                                    .length
                                    .toString(),
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Text(
                                'Subtotal: ',
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Text(
                                ShopCubit.get(context)
                                    .carts!
                                    .data!
                                    .total
                                    .toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: defaultButton(
                      function: () {
                        navigateTO(context, OrderScreen());
                      },
                      text: 'Proceed to Checkout'))
            ],
          ),
        ));
  }
}

Widget columnBalider(Product model, context) {
  return Dismissible(
    background: Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(Icons.delete, color: Colors.white),
            Text('Delete', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    ),
    key: UniqueKey(),
    onDismissed: (direction) {
      ShopCubit.get(context).changeCart(model.id!);
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 88.h,
      width: 370.w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey[300]!,
            blurStyle: BlurStyle.outer,
            blurRadius: 10),
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
                      image: NetworkImage(model.image ?? ''),
                      fit: BoxFit.cover),
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
            width: 120,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                ),
                Text(
                  model.description!,
                  maxLines: 1,
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
                Spacer(),
                Text('\$ ${model.price}')
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                //  padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 40,
                width: 91.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey[200]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove,
                          size: 14,
                        )),
                    const Text(
                      '1',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 14,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
