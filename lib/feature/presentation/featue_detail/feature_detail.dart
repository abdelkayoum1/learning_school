import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooditem/core/utile/approute.dart';
import 'package:fooditem/core/widget/button.dart';
import 'package:fooditem/core/widget/snackbar.dart';
import 'package:fooditem/feature/data/homerepo/home_repo/home_repo_iplm.dart';
import 'package:fooditem/feature/data/model/model_course.dart';
import 'package:fooditem/feature/presentation/featue_detail/cubit/cubit/detail_course_cubit_cubit.dart';
import 'package:fooditem/feature/presentation/featue_detail/detail_repos_home/detail_home_repos.dart';
import 'package:fooditem/feature/presentation/featue_detail/detail_repos_home/detail_home_repos_impl.dart';
import 'package:fooditem/feature/presentation/feature_home_book/cubit/course_cubit.dart';
import 'package:fooditem/feature/presentation/feature_home_book/cubit/course_state.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FeatureDetail extends StatefulWidget {
  final ModelCourse course;
  const FeatureDetail({super.key, required this.course});

  @override
  State<FeatureDetail> createState() => _FeatureDetailState();
}

class _FeatureDetailState extends State<FeatureDetail> {
  SupabaseClient supabase = Supabase.instance.client;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DetailCourseCubitCubit>().getallcourse(
      courseId: widget.course.id.toString(),
      userId: supabase.auth.currentUser!.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Feature detail'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
            onPressed: () async {
              await supabase.auth.signOut();
              GoRouter.of(context).push(Approute.loginhome);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: BlocConsumer<DetailCourseCubitCubit, DetailCourseCubitState>(
          listener: (context, state) {
            if (state is DetailCourseCubitfailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error.toString())));
            }
            if (state is DetailCourseCubitsucces) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('enrolled succes')));
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image.asset('assets/Image+Background.png'),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 6)],

                    color: Colors.red,
                  ),
                  child: CachedNetworkImage(
                    width: 50,
                    height: MediaQuery.of(context).size.height * 0.35,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageUrl: widget.course.image.toString(),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  widget.course.title.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1E293B),
                  ),
                ),

                Text(
                  '${widget.course.price} Dz',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff22C55E),
                  ),
                ),

                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff0F172A),
                  ),
                ),

                Text(
                  widget.course.desc.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff475569),
                  ),
                ),
                SizedBox(height: 50),
                state is DetailCourseCubitloading
                    ? Center(child: CircularProgressIndicator())
                    : Buttonn(
                        onPressed: () {
                          print(supabase.auth.currentUser!.id.toString());
                          /*
                            BlocProvider.read<DetailCourseCubitCubit>().getcourse(
                              course.id.toString(),
                              supabase.auth.currentUser!.id.toString(),
                            );
                            */
                          if (state is DetailCourseCubitInitial ||
                              state is DetailCourseCubitfailure ||
                              state is NotalreadyCourse) {
                            context.read<DetailCourseCubitCubit>().getenrolle(
                              widget.course.id.toString(),
                              supabase.auth.currentUser!.id.toString(),
                            );
                          }
                        },

                        text:
                            (state is DetailCourseCubitsucces ||
                                state is AlreadyCourseCubit)
                            ? 'enrolled course'
                            : 'Start Course',
                        color: const Color.fromARGB(255, 12, 51, 84),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
