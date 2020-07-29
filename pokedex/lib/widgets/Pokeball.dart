import 'package:pokedex/models/Pokemon.dart';
import 'package:flutter/material.dart';

class PokeBall extends StatelessWidget {
  final List<Pokemon> pokemons;
  PokeBall({@required this.pokemons});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: pokemons.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 200.0,
              width: 200.0,
              child: Card(
                color: /*Color.fromRGBO(73, 208, 176, 20)*/ Color(0xFFEF5350),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20.0),
                      width: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(pokemons[index].name,
                              style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 20.0),
                          Text(pokemons[index].name),
                          SizedBox(height: 10.0),
                          Text(pokemons[index].name)
                        ],
                      ),
                    ),
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/img/no-image.jpg',
                      image: pokemons[index].img,
                      height: 220.0,
                      width: 150.0,
                      fit: BoxFit.contain,
                    )
                  ],
                ),
              ));
        });
  }
}
