import 'package:flutter/material.dart';
import 'package:football_bloc/bloc/player_listing.bloc.dart';
import 'package:football_bloc/pages/player_listing.dart';
import 'package:football_bloc/services/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_bloc/widgets/horizontal_bar.dart';
import 'package:football_bloc/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  final PlayerRepository playerRepository;
  HomePage({this.playerRepository});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PlayerListingBloc _playerListingBloc;
  @override
  void initState() {
    super.initState();
    _playerListingBloc=PlayerListingBloc(playerRepository: widget.playerRepository);
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>_playerListingBloc,
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Football Players',style: TextStyle(color: Colors.white,fontSize: 30.0,),),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: <Widget>[
            HorizontalBar(),
            SizedBox(height: 20.0,),
            SearchBar(),
            SizedBox(height: 20.0,),
            PlayerListing(),
          ],
        ),
      ),
    );
  }
}