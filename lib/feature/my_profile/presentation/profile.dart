import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooditem/core/utile/approute.dart';
import 'package:fooditem/core/widget/button.dart';
import 'package:fooditem/feature/data/homerepo/home_repo/home_repo_iplm.dart';
import 'package:fooditem/feature/presentation/feature_home_book/cubit1.dart/name_course_cubit.dart';
import 'package:fooditem/feature/presentation/feature_home_book/cubit1.dart/name_course_state.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  SupabaseClient supabase = Supabase.instance.client;
  void logout() async {
    await supabase.auth.signOut();
    GoRouter.of(context).pop(Approute.loginhome);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = NameCourseCubit(HomeRepoIplm());
        cubit.getname();
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
          title: Text('My Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocBuilder<NameCourseCubit, NameCourseState>(
            builder: (context, state) {
              if (state is Namecoursefailure) {
                return Text(state.error);
              } else if (state is Namecoursesucces) {
                final name = state.namecours.first;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 6),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff0F172A),
                                ),
                              ),
                              Text(
                                name.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff64748B),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff0F172A),
                                ),
                              ),
                              Text(
                                name.email,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff64748B),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    state is Namecourseloading
                        ? Center(child: CircularProgressIndicator())
                        : SizedBox(
                            width: 150,

                            child: ElevatedButton.icon(
                              icon: Icon(Icons.logout, color: Colors.white),
                              onPressed: () {
                                logout();
                              },
                              label: Text(
                                'Logout',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.deepPurpleAccent,
                              ),
                            ),
                          ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
