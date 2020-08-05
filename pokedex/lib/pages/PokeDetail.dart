import 'package:flutter/material.dart';
import 'package:pokedex/models/PokeHelps.dart';
import 'package:pokedex/models/Pokemon.dart';

class PokeDetail extends StatefulWidget {
  final Pokemon pokemon;
  PokeDetail({@required this.pokemon});

  @override
  _PokeDetailState createState() => _PokeDetailState();
}

class _PokeDetailState extends State<PokeDetail> {
  @override
  Widget build(BuildContext context) {
    PokemonDetailContent content = new PokemonDetailContent();
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0.0,
            pinned: true,
            backgroundColor: Colors.transparent,
            expandedHeight: 280.0,
            floating: true,
            centerTitle: true,
            title: Text(
              widget.pokemon.name,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(children: <Widget>[
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 280.0,
                  width: double.infinity,
                  color: widget.pokemon.color,
                ),
              ),
              Column(children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 40.0),
                    Text(
                      'Pokedex',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/img/no-image.jpg',
                    image: widget.pokemon.img,
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ])
            ])),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: 5.0,
            ),
            content.bodyDetail(widget.pokemon),
            // content.bodyDetail(widget.pokemon)
          ]))
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 90);
    path.quadraticBezierTo(
        size.width / 2, size.height / 1.2, size.width, size.height - 90);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class PokemonDetailContent {
  PokeHelps helps = new PokeHelps();

  Widget setTypes(Pokemon pokemon) {
    List<Widget> lista = [];
    pokemon.type.forEach((nome) {
      lista.add(Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: helps.getColorPokemon(nome)),
        width: 100.0,
        height: 35.0,
        child: Center(
          child: Text(
            nome,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: 'Google',
                fontWeight: FontWeight.bold),
          ),
        ),
      ));
    });
    return Row(
      children: lista,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  Widget setTextContent(
      String text, Color color, FontWeight fontWeight, double size) {
    return Text(text != "null" ? text : '0',
        style: TextStyle(color: color, fontWeight: fontWeight, fontSize: size));
  }

  Widget firstRowDetail(Pokemon pokemon, List<String> headers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            child: Column(
          children: <Widget>[
            setTextContent(pokemon.num, pokemon.color, FontWeight.bold, 25.0),
            setTextContent(headers[0], pokemon.color, FontWeight.bold, 19.0),
          ],
        )),
        pokemonLine(pokemon),
        Container(
            child: Column(
          children: <Widget>[
            setTextContent(
                pokemon.height, pokemon.color, FontWeight.bold, 25.0),
            setTextContent(headers[1], pokemon.color, FontWeight.bold, 19.0),
          ],
        )),
        pokemonLine(pokemon),
        Container(
            child: Column(
          children: <Widget>[
            setTextContent(
                pokemon.weight, pokemon.color, FontWeight.bold, 25.0),
            setTextContent(headers[2], pokemon.color, FontWeight.bold, 19.0),
          ],
        ))
      ],
    );
  }

  Widget secondRowDetail(Pokemon pokemon, List<String> headers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            child: Column(
          children: <Widget>[
            setTextContent(
                pokemon.spawnTime, pokemon.color, FontWeight.bold, 25.0),
            setTextContent(headers[0], pokemon.color, FontWeight.bold, 19.0),
          ],
        )),
        pokemonLine(pokemon),
        Container(
            child: Column(
          children: <Widget>[
            setTextContent(pokemon.egg, pokemon.color, FontWeight.bold, 25.0),
            setTextContent(headers[1], pokemon.color, FontWeight.bold, 19.0),
          ],
        )),
        pokemonLine(pokemon),
        Container(
            child: Column(
          children: <Widget>[
            setTextContent(pokemon.candyCount.toString(), pokemon.color,
                FontWeight.bold, 25.0),
            setTextContent('Candy', pokemon.color, FontWeight.bold, 19.0),
          ],
        ))
      ],
    );
  }

  Widget weaknesses(Pokemon pokemon) {
    List<Widget> list = [];

    pokemon.weaknesses.forEach((weak) {
      list.add(Container(
        width: 80,
        height: 30.0,
        decoration: BoxDecoration(
          color: helps.getColorPokemon(weak),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
            child: setTextContent(weak, Colors.white, FontWeight.bold, 20.0)),
      ));
    });
    return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20.0,
        runSpacing: 20.0,
        children: list);
  }

  Widget bodyDetail(Pokemon pokemon) {
    List<Widget> list = [];

    List<Evolution> evolutions = [];
    List<Widget> listEvolutions = [];
    String evolution;
    if (pokemon.nextEvolution == null && pokemon.prevEvolution == null) {
      evolution = 'No Evolutions';
    }

    if (pokemon.nextEvolution != null && pokemon.prevEvolution == null) {
      evolution = 'Evolutions';
      evolutions = pokemon.nextEvolution;
      evolutions.forEach((element) {
        listEvolutions.add(Column(
          children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder: 'assets/img/pokeball_red.png',
              height: 120,
              width: 120,
              image: element.img,
              fit: BoxFit.contain,
            ),
            Text(element.name,
                style: TextStyle(
                    color: pokemon.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0))
          ],
        ));
      });
    }

    if (pokemon.nextEvolution == null && pokemon.prevEvolution != null) {
      evolution = 'Evolutions';
      evolutions = pokemon.prevEvolution;
      evolutions.forEach((element) {
        listEvolutions.add(Column(
          children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder: 'assets/img/pokeball_red.png',
              height: 90,
              width: 80,
              image: element.img,
              fit: BoxFit.contain,
            ),
            Text(element.name,
                style: TextStyle(
                    color: pokemon.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0))
          ],
        ));
      });
    }

    if (pokemon.nextEvolution != null && pokemon.prevEvolution != null) {
      evolution = 'Evolutions';
      pokemon.nextEvolution.forEach((element) {
        evolutions.add(element);
      });
      pokemon.prevEvolution.forEach((element) {
        evolutions.add(element);
      });
      evolutions.forEach((element) {
        listEvolutions.add(Column(
          children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder: 'assets/img/pokeball_red.png',
              height: 90,
              width: 80,
              image: element.img,
              fit: BoxFit.contain,
            ),
            Text(element.name,
                style: TextStyle(
                    color: pokemon.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0))
          ],
        ));
      });
    }

    list.add(
      Container(
        child: setTypes(pokemon),
      ),
    );

    list.add(SizedBox(height: 10.0));

    list.add(firstRowDetail(pokemon, ['Number', 'Height', 'Weight']));
    list.add(SizedBox(height: 20.0));
    list.add(secondRowDetail(pokemon, ['Spawn', 'Egg', 'Candy']));

    list.add(SizedBox(
      height: 10.0,
    ));

    list.add(
      Center(
          child: Text('Weaknesses',
              style: TextStyle(
                  color: pokemon.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0))),
    );

    list.add(SizedBox(height: 20.0));

    list.add(weaknesses(pokemon));
    list.add(Container(
      padding: EdgeInsets.only(bottom: 20.0),
    ));

    list.add(
      Center(
          child: Text(evolution,
              style: TextStyle(
                  color: pokemon.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0))),
    );

    list.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: listEvolutions,
    ));

    list.add(SizedBox(height: 5.0));

    return Column(children: list);
  }

  Widget pokemonLine(Pokemon pokemon) {
    return SizedBox(
        width: 3.0,
        height: 40.0,
        child: Container(width: 4.0, color: pokemon.color));
  }
}
