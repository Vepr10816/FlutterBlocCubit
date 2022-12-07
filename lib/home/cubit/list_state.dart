// class ListState{
//   final List history;
//   ListState({
//     this.history = [];
//   });
// }


// import 'package:flutter/cupertino.dart';

// @immutable
// abstract class ListState {}

// class ListInitial extends ListState {}

// class TestClick extends ListState{
//   final List count;
  
//   TestClick(this.count);
// }

class ListState {
  final List history;

  const ListState({required this.history});
}
