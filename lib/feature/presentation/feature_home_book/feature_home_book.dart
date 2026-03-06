import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooditem/core/utile/approute.dart';
import 'package:fooditem/core/widget/button.dart';
import 'package:fooditem/feature/data/homerepo/home_repo/home_repo_iplm.dart';
import 'package:fooditem/feature/my_course/cubit/course_repo_home/course_repo_imple.dart';
import 'package:fooditem/feature/presentation/feature_home_book/cubit/course_cubit.dart';
import 'package:fooditem/feature/presentation/feature_home_book/cubit/course_state.dart';

import 'package:fooditem/feature/presentation/feature_home_book/widget/featurecontainerappbar.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FeatureHomeBook extends StatefulWidget {
  const FeatureHomeBook({super.key});

  @override
  State<FeatureHomeBook> createState() => _FeatureHomeBookState();
}

class _FeatureHomeBookState extends State<FeatureHomeBook> {
  SupabaseClient supabaseClient = Supabase.instance.client;
  @override
  Widget build(BuildContext context) {
    //CourseRepoImple.getcourse();
    return BlocProvider(
      create: (context) {
        final cubit = CourseCubit(HomeRepoIplm());
        cubit.getcourse();
        return cubit;
      },
      child: Scaffold(
        // backgroundColor: Colors.blue,
        body: Column(
          children: [
            Featurecontainerappbar(),

            //   Expanded(child: FeaturebodtGridviews()),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Featurebodyitem(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Featurebodyitem extends StatelessWidget {
  const Featurebodyitem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseCubit, CourseState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is Coursestatefailure) {
          return Text(state.error);
        }
        if (state is Coursestatesucces) {
          if (state.course.isEmpty) {
            return Center(child: Text('no data'));
          }
          return GridView.builder(
            itemCount: state.course.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 20,
              mainAxisExtent: 250,
            ),
            itemBuilder: (context, index) {
              print(state.course.first.title);
              return Container(
                // width: 200,
                // height: 300,
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 0.20,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 20,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 10,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: state.course[index].image.toString(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),

                        SizedBox(height: 10),
                        Text(
                          state.course[index].title.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff1F2937),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${state.course.first.price} Dz',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff4B5563),
                          ),
                        ),
                        SizedBox(height: 20),
                        Buttonn(
                          onPressed: () {
                            GoRouter.of(context).push(
                              Approute.featuredetail,
                              extra: state.course[index],
                            );
                          },
                          text: 'Show Detail',
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
