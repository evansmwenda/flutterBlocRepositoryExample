
import 'package:flutter/material.dart';
import 'package:football_bloc/models/api_models.dart';

abstract class PlayerListingState {}
class PlayerUninitializedState extends PlayerListingState {}
class PlayerFetchingState extends PlayerListingState {}

class PlayerFetchedState extends PlayerListingState {
  final List<Players> players;
  PlayerFetchedState({@required this.players});
}
class PlayerErrorState extends PlayerListingState {}
class PlayerEmptyState extends PlayerListingState {}