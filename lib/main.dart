import 'package:club_companion/cubit/page_cubit.dart';
import 'package:club_companion/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageCubit(HomePageState()),
      child: MaterialApp(
        title: 'Group Work',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<PageCubit, AppPage>(
          builder: (context, state) {
            return state;
          },
        ),
      ),
    );
  }
}
