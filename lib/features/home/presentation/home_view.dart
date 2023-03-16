import 'package:bio_medical/core/custom_widgets/custom_buttom_sheet.dart';
import 'package:bio_medical/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:bio_medical/features/home/presentation/manager/home_cubit/home_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: HomeCubit.get(context)
                .appBarColor[HomeCubit.get(context).currentIndex],
            title: Text(HomeCubit.get(context)
                .titles[HomeCubit.get(context).currentIndex]),
          ),
          floatingActionButton: FloatingActionButton(
            // onPressed: () {
            //   if (HomeCubit.get(context).isBottomSheetShown) {
            //     Navigator.pop(context);
            //   } else {
            //     scaffoldKey.currentState
            //         ?.showBottomSheet(
            //           (context) => Container(
            //             width: double.infinity,
            //             clipBehavior: Clip.antiAlias,
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.circular(20.0),
            //             ),
            //             padding: const EdgeInsets.all(20.0),
            //             child: Column(
            //               mainAxisSize: MainAxisSize.min,
            //               children: [
            //                 Text('Hello there'),
            //               ],
            //             ),
            //           ),
            //           elevation: 0.0,
            //         )
            //         .closed
            //         .then((value) {
            //       HomeCubit.get(context).changeBottomSheetState(false);
            //     });
            //     HomeCubit.get(context).changeBottomSheetState(true);
            //   }
            // },
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return MyBottomSheet();
                },
              );
            },
            backgroundColor: Colors.transparent,
            elevation: 5.0,
            child: Image.asset('assets/images/subscribe.png'),
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
