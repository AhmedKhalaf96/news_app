import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/states.dart';
import 'package:news/Module/Business.dart';
import 'package:news/Module/Science.dart';
import 'package:news/Module/setting.dart';
import 'package:news/Module/sports.dart';
import 'package:news/network/dio_helper.dart';

class ApiCubit extends Cubit<ApiStates> {
  ApiCubit() : super(ApiInitialState());
  static ApiCubit get(context) => BlocProvider.of(context);

  List<dynamic>? sports;

  int currentIndex=0;

  List<Widget>screens=[
    Business(),
    Sports(),
    Science(),
    Setting()
  ];
  List<String>Appbar=[
    "Business",
    "Sport",
    "Science",
    "Setting"
  ];

  void Scr(var ind){
    currentIndex=ind;
    emit(ApigoState());
  }

  void getSport(){
    DioHelper.getData(url:'v2/top-headlines', query: {
      'country':'eg',
      'category':'sports',
      'apiKey':'0da93c46791a4f719f13e492e814f091',
    }).then((value){
      sports=value.data['articles'];
      emit(GetSportsDataState());
      print(sports![0]['title']);
    }).catchError((error){
      emit(GetSportsDataErrorState(error.toString()));
    });
  }
}