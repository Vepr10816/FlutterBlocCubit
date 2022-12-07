import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pr4_cubit/settings/cubit/setting_state.dart';

//Второй вариант со state классои
class SettingCubit extends Cubit<SettingState>{
  SettingCubit(): super(SettingState(theme: ThemeData.light()));

  void toogleTheme(){
    if(state.theme == ThemeData.light()){
      //final stateUpdate = SettingState(theme: ThemeData.dark());
      emit(SettingState(theme: ThemeData.dark()));
    }
    else{
      //final stateUpdate = SettingState(theme: ThemeData.light());
      emit(SettingState(theme: ThemeData.light()));
    }
  }
}

//Первый легкий вариант без state класса
// class SettingCubit extends Cubit<ThemeData>{
//   SettingCubit(): super(ThemeData.light());

//   void toogleTheme(){
//     if(state == ThemeData.light()){
//       emit(ThemeData.dark());
//     }
//     else{
//       emit(ThemeData.light());
//     }
//   }
// }