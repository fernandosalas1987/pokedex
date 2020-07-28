import 'dart:convert';
import 'package:pokedex/models/Pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonProvider {
  Future<List<Pokemon>> getPokemon() async {
    final response = await http.get(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    final decodedData = json.decode(response.body);
    //print(decodedData);
    final listPokemon = new Pokemons.fromJson(decodedData['pokemon']);
    return listPokemon.pokemons;
  }
}
