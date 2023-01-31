import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_application/layout/cubit/statas.dart';

import '../../layout/cubit/cubit.dart';
import '../../models/shop_app/home_model.dart';
import '../../shared/components/components.dart';

class InfoProduct extends StatelessWidget {
  final ProductModel model;
  const InfoProduct(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(listener: (context, state) {
      if (state is ShopSuccessChangeCartState) {
        if (state.cart.status!) {
          showToast(text: state.cart.message!, state: ToastStates.ERROR);
        }
      }
    }, builder: (context, x) {
      return Scaffold(
        //backgroundColor: Color.fromARGB(155, 177, 205, 247),
        // appBar: AppBar(),
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: 380.w,
              height: 500,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(model.image), fit: BoxFit.fill)),
            ),
            Container(),
            Positioned(
              top: 400,
              child: Column(
                children: [
                  Container(
                    width: 360.w,
                    height: 500,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 181, 205, 241),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Text(
                                model.name,
                                //  overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 2,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 18,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      log(rating.toString());
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text('(320 Review)'),
                                  const Spacer(),
                                  Container(
                                    height: 40,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Colors.grey[200]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.remove)),
                                        const Text(
                                          '1',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.add)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Description',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Get a little life feom these ${model.name} .',
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black45),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: Row(
                                children: [
                                  Container(
                                    width: 100.w,
                                    height: 46.h,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Total Price',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    129, 44, 44, 44),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          ),
                                          Text(
                                            '\$ ${model.price}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ]),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      ShopCubit.get(context)
                                          .changeCart(model.id);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: 180.w,
                                      height: 46.h,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.shopping_bag_outlined,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Add to cart',
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
