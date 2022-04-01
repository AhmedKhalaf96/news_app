import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/cubit.dart';
import 'package:news/Cubit/states.dart';

class NewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ApiCubit()..getSport(),
      child: BlocConsumer<ApiCubit,ApiStates>(
          listener: (context,states){},
          builder: (context,states) {
            return Scaffold(
              appBar: AppBar(
                title: Text(ApiCubit.get(context).Appbar[ApiCubit.get(context).currentIndex],style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing:3),),
                backgroundColor: Colors.blue[900],
              ),
              body: ApiCubit.get(context).screens[ApiCubit.get(context).currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.blue[900],
                selectedItemColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                currentIndex: ApiCubit.get(context).currentIndex,
                onTap:(index){
                  ApiCubit.get(context).Scr(index);
                },
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.business,),
                    label: "Business",
                  ),
                  BottomNavigationBarItem(icon: Icon(Icons.sports),
                    label: "Sport",
                  ),
                  BottomNavigationBarItem(icon: Icon(Icons.science),
                    label: "Science",
                  ),
                  BottomNavigationBarItem(icon: Icon(Icons.settings),
                    label: "Setting",
                  ),
                ],

              ),
            );
          }
      ),
    );
  }
}
