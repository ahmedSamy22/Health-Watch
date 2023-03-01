import 'package:bio_medical/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:bio_medical/features/home/presentation/manager/home_cubit/home_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(HomeCubit.get(context)
                .titles[HomeCubit.get(context).currentIndex]),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              HomeCubit.get(context).changeBNav(index);
            },
            currentIndex: HomeCubit.get(context).currentIndex,
            backgroundColor: Colors.white,
            elevation: 20,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bluetooth_connected),
                label: 'Connect',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
          body: HomeCubit.get(context)
              .screens[HomeCubit.get(context).currentIndex],
        );
      },
    );
  }
}
