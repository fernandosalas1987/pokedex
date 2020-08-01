import 'package:pokedex/models/Pokemon.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pages/PokeDetail.dart';
import 'package:pokedex/widgets/Pokecard.dart';

class PokeBall extends StatelessWidget {
  final List<Pokemon> pokemons;
  PokeBall({@required this.pokemons});

  @override
  Widget build(BuildContext context) {
    int count;

    if (MediaQuery.of(context).orientation == Orientation.landscape)
      count = 4;
    else
      count = 2;
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(12),
        addAutomaticKeepAlives: true,
        itemCount: pokemons.length,
        shrinkWrap: true,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                PokeDetail(pokemon: pokemons[index])));
                  },
                  child: Pokecard(pokemon: pokemons[index])));
        });
  }
}
