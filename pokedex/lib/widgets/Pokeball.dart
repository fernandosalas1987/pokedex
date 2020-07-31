import 'package:pokedex/models/Pokemon.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pages/PokeDetail.dart';

class PokeBall extends StatelessWidget {
  final List<Pokemon> pokemons;
  PokeBall({@required this.pokemons});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(12),
        addAutomaticKeepAlives: true,
        itemCount: pokemons.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
            child: Card(
              color: pokemons[index].color,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 5.0,
                  ),
                  Stack(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 80),
                      child: Opacity(
                          opacity: 0.2,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset('assets/img/pokeball.png',
                                height: 120, width: 100),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 80),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/img/no-image.jpg',
                          image: pokemons[index].img,
                          height: 120,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(pokemons[index].name,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 12.0),
                          _setTypes(pokemons[index].type)
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ));
        });
  }

  Widget _setTypes(List<String> types) {
    List<Widget> lista = [];
    types.forEach((nome) {
      lista.add(
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(80, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  nome.trim(),
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      );
    });
    return Column(
      children: lista,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
