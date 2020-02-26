
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/View/Home.dart';
import 'package:flutter_mvvm/ViewModel/MovieListVM.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
  home: App(),
  debugShowCheckedModeBanner: false,
));

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider(
       create: (_) => MovieListVM(),
       child: Home(),);
  }
}
