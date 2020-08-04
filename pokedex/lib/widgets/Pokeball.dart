import 'package:pokedex/models/Pokemon.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pages/PokeDetail.dart';
import 'package:pokedex/widgets/Pokecard.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
    return AnimationLimiter(
      child: GridView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(12),
          addAutomaticKeepAlives: true,
          itemCount: pokemons.length,
          shrinkWrap: true,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count),
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredGrid(
              duration: Duration(milliseconds: 600),
              position: index,
              columnCount: count,
              child: ScaleAnimation(
                child: Container(
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PokeDetail(pokemon: pokemons[index])));
                        },
                        child: Pokecard(pokemon: pokemons[index]))),
              ),
            );
          }),
    );
  }
}
