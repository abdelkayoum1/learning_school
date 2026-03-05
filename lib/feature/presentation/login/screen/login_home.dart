import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooditem/core/utile/approute.dart';
import 'package:fooditem/core/utile/text_style.dart';
import 'package:fooditem/core/widget/button.dart';
import 'package:fooditem/core/widget/customer_text_fieled.dart';
import 'package:fooditem/feature/data/homerepo/home_repo/home_repo_iplm.dart';
import 'package:fooditem/feature/presentation/login/cubit/cubit/login_cubit_cubit.dart';
import 'package:fooditem/feature/presentation/login/screen/widget/dividerr.dart';
import 'package:fooditem/feature/presentation/login/screen/widget/googleetfacebooketiphone.dart';

import 'package:fooditem/feature/presentation/login/screen/widget/stack_image.dart';
import 'package:go_router/go_router.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  TextEditingController password = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => LoginCubitCubit(HomeRepoIplm()),
        child: Scaffold(
          body: Column(
            children: [
              Stackimage(title: 'Login'),
              SizedBox(height: 3),
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
                      child: BlocConsumer<LoginCubitCubit, LoginCubitState>(
                        listener: (context, state) {
                          if (state is LoginCubitfailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.error)),
                            );
                          } else if (state is LoginCubitsucces) {
                            GoRouter.of(context).push(Approute.buttonbar);
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please remplire your champ email';
                                    }
                                    if (!value.contains('@')) {
                                      return 'please donner email valid';
                                    }
                                    return null;
                                  },
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please remplire your champ password';
                                    }
                                    if (value.length < 6) {
                                      return 'please donner password superieure a 6';
                                    }
                                    return null;
                                  },
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
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),

                                state is LoginCubitloading
                                    ? Center(child: CircularProgressIndicator())
                                    : Buttonn(
                                        color: Colors.blue,
                                        onPressed: () {
                                          if (key.currentState!.validate()) {
                                            print(password.text);
                                            context
                                                .read<LoginCubitCubit>()
                                                .getlogin(
                                                  // name: name.text.trim(),
                                                  email: email.text.trim(),
                                                  password: password.text
                                                      .trim(),
                                                );
                                            print(name.text);
                                          }
                                        },
                                        text: 'Login',
                                      ),
                                SizedBox(height: 10),
                                dividerr(),
                                SizedBox(height: 5),
                                Googleetfacebooketiphone(),
                                SizedBox(height: 60),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account? ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff64748B),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        GoRouter.of(
                                          context,
                                        ).push(Approute.signhome);
                                      },
                                      child: Text(
                                        "Sin Up",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xff3B71D8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
