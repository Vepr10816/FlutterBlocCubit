import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr4_cubit/home/cubit/counter_cubit.dart';
import 'package:pr4_cubit/home/cubit/counter_state.dart';
import 'package:pr4_cubit/settings/cubit/setting_state.dart';

import '../../settings/cubit/setting_cubit.dart';
import '../../settings/views/setting_page.dart';
import '../cubit/list_cubit.dart';
import '../cubit/list_state.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('4 Практическая'),
        actions: [
          ElevatedButton(onPressed: (){
            final route = MaterialPageRoute(
              builder: (context) => const SettingPage()
              );
              Navigator.push(context, route);
          }, child: const Text('Setting'),
          )
        ],
      ),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          <Widget>[
          BlocBuilder<CounterCubit,CounterState>(
          builder: (context, state) {

            return Center(child: Text('${state.count}'));

          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: ()
                {
                  if(context.read<SettingCubit>().state.theme == ThemeData.light())
                  {
                    context.read<CounterCubit>().increment();
                    context.read<ListCubit>().addHistory("увелечение счетчика на 1");
                  }
                  else
                  {
                    context.read<CounterCubit>().increment();
                    context.read<CounterCubit>().increment();
                    context.read<ListCubit>().addHistory("увелечение счетчика на 2");
                  }
                }, 
                child: Text('+')
              ),

              ElevatedButton(
                onPressed: ()
                {
                  if(context.read<SettingCubit>().state.theme == ThemeData.light())
                  {
                    context.read<CounterCubit>().decrement();
                    context.read<ListCubit>().addHistory("уменьшение счетчика на 1");
                  }
                  else
                  {
                    context.read<CounterCubit>().decrement();
                    context.read<CounterCubit>().decrement(); 
                    context.read<ListCubit>().addHistory("увелечение счетчика на 2");
                  }
                }, 
                child: Text('-')
              )
            ]
          ),

          Expanded(
          child: SizedBox(
            height: 500.0,
            child: 
            BlocBuilder<ListCubit, ListState>(
              builder: (context, state)
              {
                return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: context.read<ListCubit>().state.history.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(index.toString()),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${context.read<ListCubit>().state.history[index]}'),
                    ),

                  ]
                  );
              }
              );
              }
            )
          ),
        ),
      ]
      ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<SettingCubit>().toogleTheme();
              if(context.read<SettingCubit>().state.theme == ThemeData.light())
                context.read<ListCubit>().addHistory("Светлая тема");
              else
                context.read<ListCubit>().addHistory('Тёмная тема');
            },
            tooltip: 'Switch Theme',
            child: context.read<SettingCubit>().state.theme == ThemeData.light()
            ? const Icon(Icons.dark_mode)
            : const Icon(Icons.light_mode),
          ),
        ],
      )

    );
  }
}