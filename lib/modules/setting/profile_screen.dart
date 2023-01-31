import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_application/layout/cubit/cubit.dart';
import 'package:shop_application/models/maps/maps_screen.dart';
import 'package:shop_application/modules/cart_screen.dart';
import 'package:shop_application/modules/favorites/home_favrites.dart';
import 'package:shop_application/modules/my_order_screen.dart';
import 'package:shop_application/modules/profile_setting.dart';
import 'package:shop_application/modules/setting/page_steting.dart';
import 'package:shop_application/modules/setting/setting.dart';
import 'package:shop_application/shared/components/components.dart';
import 'package:shop_application/shared/components/constants.dart';

import '../../layout/cubit/statas.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            elevation: 0,
            title: Container(
                child: Image.asset(
              'assets/images/sound.png',
              width: 35,
            )),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
            ],
          ),
          backgroundColor: const Color.fromARGB(176, 255, 255, 255),
          body: ConditionalBuilder(
              fallback: (context) => const CircularProgressIndicator(),
              condition: ShopCubit.get(context).usreModel != null,
              builder: (context) => SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 25),
                          height: 70.h,
                          width: 370.w,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[300]!,
                                    blurStyle: BlurStyle.outer,
                                    blurRadius: 10),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  // if (model.discount != 0)
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    height: 58.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              ShopCubit.get(context)
                                                      .usreModel!
                                                      .data!
                                                      .image ??
                                                  'assets/images/man.png'),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ShopCubit.get(context)
                                          .usreModel!
                                          .data!
                                          .name!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      ShopCubit.get(context)
                                          .usreModel!
                                          .data!
                                          .email!,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.black38),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          height: 490,
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
                              top: BorderSide(
                                  width: 1, color: Colors.grey[200]!),
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[200]!),
                              right: BorderSide(
                                  width: 1, color: Colors.grey[200]!),
                              left: BorderSide(
                                  width: 1, color: Colors.grey[200]!),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 35),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () =>
                                      navigateTO(context, SettingScreen()),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Icon(
                                          Icons.person,
                                          size: 30,
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: const Text(
                                            'Personal Details',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                      const Spacer(),
                                      const Icon(Icons.arrow_forward_ios)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    navigateTO(context, MyOrderScreen());
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Icon(
                                          Icons.shopping_bag,
                                          size: 30,
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: const Text(
                                            'My Order',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                      const Spacer(),
                                      const Icon(Icons.arrow_forward_ios)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    navigateTO(context, HomeFavrites());
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Icon(
                                          Icons.favorite,
                                          size: 30,
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: const Text(
                                            'My Favorite',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                      const Spacer(),
                                      const Icon(Icons.arrow_forward_ios)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    navigateTO(context, MapsScreen());
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Icon(
                                          Icons.directions_bus_filled_rounded,
                                          size: 30,
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: const Text(
                                            'Shipping Address',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                      const Spacer(),
                                      const Icon(Icons.arrow_forward_ios)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    navigateTO(context, CartScreen());
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Icon(
                                          Icons.shopping_bag_rounded,
                                          size: 30,
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: const Text(
                                            'My Cart',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                      const Spacer(),
                                      const Icon(Icons.arrow_forward_ios)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    navigateTO(context, PageSetting());
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Icon(
                                          Icons.settings,
                                          size: 30,
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                          ),
                                          child: const Text(
                                            'Settings',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                      const Spacer(),
                                      const Icon(Icons.arrow_forward_ios)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          height: 285,
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
                              top: BorderSide(
                                  width: 1, color: Colors.grey[200]!),
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[200]!),
                              right: BorderSide(
                                  width: 1, color: Colors.grey[200]!),
                              left: BorderSide(
                                  width: 1, color: Colors.grey[200]!),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 35),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Icon(
                                        Icons.question_mark,
                                        size: 30,
                                      ),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: const Text(
                                          'FAQs',
                                          style: TextStyle(fontSize: 18),
                                        )),
                                    const Spacer(),
                                    const Icon(Icons.arrow_forward_ios)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Icon(
                                        Icons.privacy_tip_rounded,
                                        size: 30,
                                      ),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: const Text(
                                          'Privacy Policy',
                                          style: TextStyle(fontSize: 18),
                                        )),
                                    const Spacer(),
                                    const Icon(Icons.arrow_forward_ios)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    signOut(context);
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Icon(
                                          Icons.logout_outlined,
                                          size: 30,
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: const Text(
                                            'Sign out',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                      const Spacer(),
                                      const Icon(Icons.arrow_forward_ios)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  )),
        );
      },
      listener: (context, state) {},
    );
  }
}
