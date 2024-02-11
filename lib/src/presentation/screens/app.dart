import 'package:be_my_valentine/src/presentation/bloc/photos/photo_bloc.dart';
import 'package:be_my_valentine/src/presentation/screens/bottom_bar/gallery.dart';
import 'package:be_my_valentine/src/presentation/screens/bottom_bar/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int currentIndex = 0;

  final List<Widget> body = const [
    HomeScreen(),
    GalleryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PhotoBloc>().add(AddPhoto(
            description: "This is test",
            title: "TITLE TEST"
          ));
        },
        shape: const StadiumBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        height: kBottomNavigationBarHeight,
        // backgroundColor: Colors.transparent,
        // selectedIndex: currentIndex,
        // onDestinationSelected: (int index) {
        //   setState(() {
        //     currentIndex = index;
        //   });
        // },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
            IconButton(
              selectedIcon: Icon(Icons.home),
              icon: Text("Home"),
              onPressed: () {},
            ),
            IconButton(
              selectedIcon: Icon(Icons.home),
              icon: Text("Gallery"),
              onPressed: () {},
            ),
          ],
        ),

      ),
      body: body[currentIndex],
    );
  }
}
