import 'package:flutter/material.dart';
import 'package:fooditem/core/widget/button.dart';

import 'package:fooditem/feature/presentation/feature_home_book/widget/featurecontainerappbar.dart';

class FeatureHomeBook extends StatelessWidget {
  const FeatureHomeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

class Featurebodyitem extends StatelessWidget {
  const Featurebodyitem({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
        mainAxisExtent: 250,
      ),
      itemBuilder: (context, index) {
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
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/Background (1).png',
                    width: double.infinity,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'nodejs course',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1F2937),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '300 EGP',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff4B5563),
                    ),
                  ),
                  SizedBox(height: 20),
                  Buttonn(text: 'Show Detail', color: Colors.blue),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
