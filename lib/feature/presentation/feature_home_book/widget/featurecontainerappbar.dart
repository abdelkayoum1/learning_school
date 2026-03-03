import 'package:flutter/material.dart';
import 'package:fooditem/core/widget/customer_text_fieled.dart';

class Featurecontainerappbar extends StatelessWidget {
  const Featurecontainerappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi ! Ahmed wael'),
              Text('Welcome to Cs Academy'),
              SizedBox(height: 10),
              CustomerTextFieled(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                title: 'What are you looking for ?',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
