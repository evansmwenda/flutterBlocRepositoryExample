

import 'package:football_bloc/models/api_models.dart';
import 'package:football_bloc/services/player_api_provider.dart';

class PlayerRepository {
  PlayerApiProvider _playerApiProvider = PlayerApiProvider();

  Future<List<Players>> fetchPlayersByCountry(String countryId) =>
      _playerApiProvider.fetchPlayersByCountry(countryId);
  Future<List<Players>> fetchPlayersByName(String name) =>
      _playerApiProvider.fetchPlayersByName(name);
}