import "package:flutter/material.dart";
import 'package:pr4_cubit/settings/cubit/setting_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget{
  const SettingPage({Key? key}) : super(key: key);

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Page'),
      ),
      body: 
      Center(
        child: 
        ElevatedButton(
          child: Text('Сменить тему'),
          onPressed: (){
            context.read<SettingCubit>().toogleTheme();
          },
      ),
      ),
    );
  }
}