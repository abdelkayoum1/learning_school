import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooditem/feature/presentation/navigation_bav/book.dart';
import 'package:fooditem/feature/presentation/navigation_bav/cubit/navigate_cubit_cubit.dart';

class ButtonNavigationBar extends StatelessWidget {
  const ButtonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    //  List<Widget> list = [Book(), SizedBox(), SizedBox()];
    return BlocProvider(
      create: (context) => NavigateCubitCubit(),
      child: BlocBuilder<NavigateCubitCubit, NavigateCubitState>(
        builder: (context, state) {
          return Scaffold(
            body: context
                .read<NavigateCubitCubit>()
                .list[context.read<NavigateCubitCubit>().currentindex],
            bottomNavigationBar: Container(
              color: Colors.black,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.blue,
                  currentIndex: context.read<NavigateCubitCubit>().currentindex,
                  selectedItemColor: Colors.red,
                  unselectedItemColor: Colors.white,
                  onTap: (index) {
                    context.read<NavigateCubitCubit>().change(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.book),
                      label: 'My_Course',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Prefile',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
