import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooditem/core/utile/approute.dart';
import 'package:fooditem/core/utile/text_style.dart';
import 'package:fooditem/core/widget/button.dart';
import 'package:fooditem/core/widget/customer_text_fieled.dart';
import 'package:fooditem/feature/data/homerepo/home_repo/home_repo_iplm.dart';
import 'package:fooditem/feature/presentation/login/screen/widget/dividerr.dart';
import 'package:fooditem/feature/presentation/login/screen/widget/googleetfacebooketiphone.dart';

import 'package:fooditem/feature/presentation/login/screen/widget/stack_image.dart';
import 'package:fooditem/feature/presentation/sign%20up/cubit/cubit/signin_cubit_cubit.dart';
import 'package:go_router/go_router.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confirmepassword = TextEditingController();
  final TextEditingController name = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SigninCubitCubit(HomeRepoIplm()),

        child: Scaffold(
          body: Column(
            children: [
              Stackimage(),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  width: double.infinity,
                  // height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        spreadRadius: 3,
                        blurRadius: 6,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ],
                    //color: Color(0xffFCFCFC),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SingleChildScrollView(
                      child: BlocConsumer<SigninCubitCubit, SigninCubitState>(
                        listener: (context, state) {
                          if (state is SignCubitfailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.error)),
                            );
                          } else if (state is SignCubitsucces) {
                            GoRouter.of(context).push(Approute.loginhome);
                          }
                        },
                        builder: (context, state) {
                          return Form(
                            key: key,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //  Containerapphome(),
                                /*
                            Text(
                              'Welcome Back',
                              style: TextStyle(
                                color: Color(0xff0F172A),
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 32,
                              ),
                            ),
                            SizedBox(height: 5),
                            
                            Text(
                              'Sign in to continue your culinary journey',
                              style: TextStyle(
                                color: Color(0xff64748B),
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            */
                                SizedBox(height: 20),
                                Text('Email', style: TextStylee.textfieled),
                                SizedBox(height: 5),

                                CustomerTextFieled(
                                  controller: email,
                                  prefixIcon: Icon(
                                    size: 14,
                                    Icons.email,
                                    color: Color(0xff3B71D8),
                                    weight: 16,
                                  ),

                                  title: 'Entrer your Email',
                                ),
                                SizedBox(height: 20),
                                Text('password', style: TextStylee.textfieled),
                                SizedBox(height: 5),

                                CustomerTextFieled(
                                  controller: password,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    weight: 16,
                                    size: 14,
                                    color: Color(0xff3B71D8),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.visibility,
                                    color: Color(0xff94A3B8),
                                  ),
                                  title: 'Entrer your Password',
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Confirmer_password',
                                  style: TextStylee.textfieled,
                                ),
                                SizedBox(height: 5),

                                CustomerTextFieled(
                                  controller: confirmepassword,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    weight: 16,
                                    size: 14,
                                    color: Color(0xff3B71D8),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.visibility,
                                    color: Color(0xff94A3B8),
                                  ),
                                  title: 'Confirme Password',
                                ),
                                SizedBox(height: 10),
                                CustomerTextFieled(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please remplir cette champe';
                                    }
                                  },
                                  controller: name,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    weight: 16,
                                    size: 14,
                                    color: Color(0xff3B71D8),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.visibility,
                                    color: Color(0xff94A3B8),
                                  ),
                                  title: 'name',
                                ),

                                SizedBox(height: 10),
                                state is SignCubitloading
                                    ? Center(child: CircularProgressIndicator())
                                    : Buttonn(
                                        color: Colors.blue,
                                        onPressed: () {
                                          if (key.currentState!.validate()) {
                                            context
                                                .read<SigninCubitCubit>()
                                                .getsign(
                                                  name: name.text.trim(),
                                                  password: email.text.trim(),
                                                  email: email.text.trim(),
                                                );
                                            print(name.text);
                                          }
                                        },
                                        text: 'Sign In',
                                      ),
                                SizedBox(height: 10),
                                dividerr(),
                                SizedBox(height: 5),
                                Googleetfacebooketiphone(),
                                SizedBox(height: 60),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
