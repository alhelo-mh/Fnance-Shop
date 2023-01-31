import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_application/layout/cubit/cubit.dart';
import 'package:shop_application/layout/cubit/statas.dart';
import 'package:shop_application/shared/components/components.dart';

class PageSetting extends StatelessWidget {
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
                      width: 250.w,
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
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            if (state is ShopLoadingGetUpdateUserState)
                              const LinearProgressIndicator(),
                            const SizedBox(
                              height: 20,
                            ),
                            defaultFormField(
                                controller: nameController,
                                type: TextInputType.name,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'name most not empty';
                                  }
                                },
                                label: 'name',
                                prefix: Icons.person),
                            const SizedBox(
                              height: 20,
                            ),
                            defaultFormField(
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'email most not empty';
                                  }
                                },
                                label: 'email',
                                prefix: Icons.email),
                            const SizedBox(
                              height: 20,
                            ),
                            defaultFormField(
                                controller: phoneController,
                                type: TextInputType.phone,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'phone  most not empty';
                                  }
                                },
                                label: 'phone',
                                prefix: Icons.phone),

                            const SizedBox(
                              height: 40,
                            ),
                            defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    ShopCubit.get(context).getUpdateUser(
                                      name: nameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                    );
                                  }
                                },
                                text: 'UPDATE'),

                            // defaultButton(
                            //     function: () {
                            //       signOut(context);
                            //     },
                            //     text: 'LOGOUT'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            fallback: (context) => const CircularProgressIndicator(),
          );
        });
  }
}
