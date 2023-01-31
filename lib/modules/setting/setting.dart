import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_application/layout/cubit/cubit.dart';
import 'package:shop_application/layout/cubit/statas.dart';
import 'package:shop_application/modules/setting/page_steting.dart';
import 'package:shop_application/shared/components/components.dart';

class SettingScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var imageController = TextEditingController();

  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var model = ShopCubit.get(context).usreModel;
          nameController.text = model!.data!.name!;
          //phoneController.text = model.data!.image!;
          emailController.text = model.data!.email!;
          phoneController.text = model.data!.phone!;

          return ConditionalBuilder(
            condition: ShopCubit.get(context).usreModel != null,
            builder: (context) => Scaffold(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 120, vertical: 50),
                      height: 150.h,
                      width: 280.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/man.png'),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[300]!,
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
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
                          bottom:
                              BorderSide(width: 1, color: Colors.grey[200]!),
                          right: BorderSide(width: 1, color: Colors.grey[200]!),
                          left: BorderSide(width: 1, color: Colors.grey[200]!),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 30),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Name :',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                                Text(
                                  ShopCubit.get(context).usreModel!.data!.name!,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Email :',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                                Text(
                                  ShopCubit.get(context)
                                      .usreModel!
                                      .data!
                                      .email!,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Phone :',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                                Text(
                                  ShopCubit.get(context)
                                      .usreModel!
                                      .data!
                                      .phone!,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'credit : ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                                Text(
                                  ShopCubit.get(context)
                                      .usreModel!
                                      .data!
                                      .credit
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'point : ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                                Text(
                                  ShopCubit.get(context)
                                      .usreModel!
                                      .data!
                                      .points
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: defaultTextButton(
                          function: () {
                            navigateTO(context, PageSetting());
                          },
                          text: 'up data Profile'),
                    )
                  ],
                ),
              ),
            ),
            fallback: (context) => const CircularProgressIndicator(),
          );
        });
  }
}
