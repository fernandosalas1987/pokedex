import 'package:flutter/material.dart';
import 'package:pokedex/providers/PokemonProvider.dart';
import 'package:pokedex/widgets/AppBarHome.dart';
import 'package:pokedex/widgets/Pokeball.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _screensize = MediaQuery.of(context).size;
    final pokemonProvider = new PokemonProvider();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
                top: -(500 / 4.7),
                left: _screensize.width - (310 / 1.6),
                child: Image.asset(
                  'assets/img/pokeball_dark.png',
                  color: Colors.grey[200],
                  height: 300.0,
                  width: 300.0,
                )),
            Container(
              height: _screensize.height,
              child: Column(
                children: <Widget>[
                  AppBarHome(),
                  Expanded(
                    child: FutureBuilder(
                      future: pokemonProvider.getPokemon(),
                      builder:
                          (BuildContext context, AsyncSnapshot<List> snapshot) {
                        if (snapshot.data != null) {
                          return PokeBall(pokemons: snapshot.data);
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
