import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Model/news_layout.dart';
import 'package:news/network/dio_helper.dart';

void main() {
  DioHelper.init();
  BlocOverrides.runZoned(
      (){
        runApp(const MyApp());
      },
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewScreen(),
    );
  }
}
