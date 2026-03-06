import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooditem/feature/data/model/model_course.dart';
import 'package:fooditem/feature/myvideo/data/my_video_home_repo/my_video_home_repo_impl.dart';
import 'package:fooditem/feature/myvideo/data/myvideo_cubit/myvideo_cubit.dart';
import 'package:fooditem/feature/myvideo/data/myvideo_cubit/myvideo_state.dart';

class MyVideo extends StatelessWidget {
  final String coursId;
  const MyVideo({super.key, required this.coursId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = MyvideoCubit(MyVideoHomeRepoImpl());
        cubit.getvideo(courseId: coursId);
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
          title: Text('course Video'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<MyvideoCubit, MyvideoState>(
            builder: (context, state) {
              if (state is MyvideoStatefailure) {
                return Text(state.error);
              } else if (state is MyvideoStatesucces) {
                if (state.coursevideo.isEmpty) {
                  return Center(child: Text('notfound'));
                }
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.coursevideo.length,
                        itemBuilder: (context, index) {
                          final coursevideo = state.coursevideo[index];
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
                              padding: const EdgeInsets.only(
                                right: 10,
                                left: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        coursevideo.title.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff111827),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        coursevideo.desc.toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xff64748B),
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.video_call),
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
