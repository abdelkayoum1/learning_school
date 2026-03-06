import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooditem/core/utile/approute.dart';
import 'package:fooditem/core/widget/button.dart';
import 'package:fooditem/feature/my_course/cubit/course_repo_home/course_repo_imple.dart';
import 'package:fooditem/feature/my_course/presentation/mycourse_cubit/mycourse_cubit_cubit.dart';
import 'package:go_router/go_router.dart';

class MyCourse extends StatelessWidget {
  const MyCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = MycourseCubitCubit(CourseRepoImple());
        cubit.getmycourse();
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Subscribed courses',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xffFFFFFF),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<MycourseCubitCubit, MycourseCubitState>(
            builder: (context, state) {
              if (state is MycourseCubitfailre) {
                return Text(state.error);
              } else if (state is MycourseCubitsucces) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.cours.length,
                        itemBuilder: (context, index) {
                          final course = state.cours[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: 15),
                            alignment: Alignment.centerLeft,
                            width: double.infinity,

                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 6),
                              ],
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 20.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,

                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: course.image.toString(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        course.title.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff111827),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () {
                                          GoRouter.of(context).push(
                                            Approute.myvideo,
                                            extra: state.cours[index].id,
                                          );
                                        },
                                        child: Text(
                                          'complete',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xffFFFFFF),
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
