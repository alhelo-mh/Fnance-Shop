import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/layout/shop_layout.dart';

import 'package:shop_application/modules/register/cubit/cubit.dart';
import 'package:shop_application/modules/register/cubit/statas.dart';
import 'package:shop_application/shared/components/components.dart';
import 'package:shop_application/shared/components/constants.dart';

import 'package:shop_application/shared/network/local/ccch_helper.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterState>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessState) {
            if (state.model.status!) {
              CacheHelper.saveData(key: 'token', value: state.model.data!.token)
                  .then((value) {
                token = state.model.data!.token!;
                navigateAndFinish(context, const ShopLayout());
              });
              showToast(text: state.model.message!, state: ToastStates.SUCCESS);
            } else {
              showToast(text: state.model.message!, state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) => Scaffold(
          //   appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            //color: Colors.amber,
                            height: 180,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Image.asset(
                              'assets/images/finance.gif',
                              height: 180,

                              //fit: BoxFit.cover,
                            )),
                        Text(
                          'SIGN UP',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          'Please Sign Up now ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(height: 20),
                        defaultFormField(
                          controller: nameController,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Name must be empty';
                            }
                            return null;
                          },
                          label: 'Name',
                          prefix: Icons.person,
                          type: TextInputType.name,
                        ),
                        const SizedBox(height: 20),
                        defaultFormField(
                          controller: emailController,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Email must be empty';
                            }
                            return null;
                          },
                          label: 'Email',
                          prefix: Icons.email,
                          type: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        defaultFormField(
                          controller: passwordController,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'password must be empty';
                            }
                            return null;
                          },
                          label: 'Password',
                          prefix: Icons.lock,
                          suffix: ShopRegisterCubit.get(context).suffix,
                          ispassword: ShopRegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            ShopRegisterCubit.get(context)
                                .changrPasswordSuffix();
                          },
                          onSubmit: (value) {},
                          type: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 20),
                        defaultFormField(
                          controller: phoneController,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Phone must be empty';
                            }
                            return null;
                          },
                          label: 'Phone',
                          prefix: Icons.phone,
                          type: TextInputType.phone,
                        ),
                        const SizedBox(height: 20),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                ShopRegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            text: 'login',
                            radius: 20,
                          ),
                          fallback: (BuildContext context) =>
                              const CircularProgressIndicator(),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
