import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr4_cubit/home/cubit/counter_cubit.dart';
import 'package:pr4_cubit/home/cubit/list_cubit.dart';
import 'package:pr4_cubit/home/views/home_page.dart';
import 'package:pr4_cubit/settings/cubit/setting_cubit.dart';
import 'package:pr4_cubit/settings/cubit/setting_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => SettingCubit()),
        BlocProvider(create: (context) => ListCubit())
      ],

      child: BlocBuilder<SettingCubit, /*ThemeData*/ SettingState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.theme,
            home: const HomePage(),
          );
        }
      ),
    );
  }
}
