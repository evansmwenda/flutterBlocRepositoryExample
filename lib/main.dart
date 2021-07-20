import 'package:flutter/material.dart';
import 'package:football_bloc/pages/home.dart';
import 'package:football_bloc/services/repository.dart';

void main(){
  PlayerRepository _repository=PlayerRepository();
  runApp(MyApp(playerRepository:_repository));
}

class MyApp extends StatelessWidget {
  final PlayerRepository playerRepository;
  MyApp({this.playerRepository});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Implementation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(playerRepository:playerRepository),
    );
  }
}