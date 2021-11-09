import 'package:club_companion/cubit/page_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
      color: Colors.blue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
              tileColor: Colors.blue,
              title: const Text(
                'Saved Music',
                style:
                    TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
              ),
              onTap: () {
                BlocProvider.of<PageCubit>(context)
                    .returnPage(PageType.savedMusicPage);
                //Navigator.of(context).pop(context);
              }),
          ListTile(
              tileColor: Colors.blue,
              title: const Text(
                'Home Page',
                style:
                    TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
              ),
              onTap: () {
                BlocProvider.of<PageCubit>(context)
                    .returnPage(PageType.homePage);
                //Navigator.of(context).pop(context);
              }),
          ListTile(
              tileColor: Colors.blue,
              title: const Text(
                'Second Page',
                style:
                    TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
              ),
              onTap: () {
                BlocProvider.of<PageCubit>(context)
                    .returnPage(PageType.secondPage);
                //Navigator.of(context).pop(context);
              }),
        ],
      ),
    ));
  }
}
