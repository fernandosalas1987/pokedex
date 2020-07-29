import 'package:flutter/material.dart';
import 'package:pokedex/providers/PokemonProvider.dart';
import 'package:pokedex/widgets/Pokeball.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonProvider = new PokemonProvider();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pokedex'),
          backgroundColor: Color(0xFFEF5350),
        ),
        body: FutureBuilder(
          future: pokemonProvider.getPokemon(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return PokeBall(pokemons: snapshot.data);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
