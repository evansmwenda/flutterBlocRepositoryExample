import 'package:flutter/material.dart';
import 'package:football_bloc/bloc/player_listing_event.dart';
import 'package:football_bloc/bloc/player_listing_states.dart';
import 'package:bloc/bloc.dart';
import 'package:football_bloc/models/api_models.dart';
import 'package:football_bloc/services/repository.dart';


class PlayerListingBloc extends Bloc<PlayerListingEvent, PlayerListingState> {
  final PlayerRepository playerRepository;
  PlayerListingBloc({this.playerRepository}) : assert(playerRepository != null), super(PlayerUninitializedState());
  @override
  void onTransition(Transition<PlayerListingEvent, PlayerListingState> transition) {
    super.onTransition(transition);
    print(transition);
  }
  @override
  PlayerListingState get initialState => PlayerUninitializedState();

  @override
  Stream<PlayerListingState> mapEventToState(PlayerListingEvent event) async* {
    yield PlayerFetchingState();
    List<Players> players;
    try {
      if (event is CountrySelectedEvent) {
        players = await playerRepository
            .fetchPlayersByCountry(event.nationModel.countryId);
      } else if (event is SearchTextChangedEvent) {
        players = await playerRepository.fetchPlayersByName(event.searchTerm);
      }
      if (players.length == 0) {
        yield PlayerEmptyState();
      } else {
        yield PlayerFetchedState(players: players);
      }
    } catch (_) {
      yield PlayerErrorState();
    }
  }

}