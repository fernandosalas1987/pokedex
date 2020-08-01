import 'package:flutter/material.dart';
import 'package:pokedex/models/PokeHelps.dart';
import 'package:pokedex/models/Pokemon.dart';
import 'package:pokedex/pages/HomePage.dart';

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
      body: Stack(children: <Widget>[
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            height: 300.0,
            width: double.infinity,
            color: widget.pokemon.color,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 60.0,
            ),
            Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomePage()));
                    }),
                Text(
                  'Pokedex',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                )
              ],
            ),
            Container(
                child: Text(
              widget.pokemon.name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0),
            )),
            FadeInImage.assetNetwork(
              placeholder: 'assets/img/no-image.jpg',
              image: widget.pokemon.img,
              height: 200,
              width: 200,
              fit: BoxFit.contain,
            ),
            Container(
              child: content.setTypes(widget.pokemon),
            ),
            SizedBox(height: 20.0),
            content
                .firstRowDetail(widget.pokemon, ['Spaw', 'Height', 'Weight']),
            SizedBox(
              height: 20.0,
            ),
            Center(
                child: Text('Weaknesses',
                    style: TextStyle(
                        color: widget.pokemon.color,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0))),
            SizedBox(height: 20.0),
            content.weaknesses(widget.pokemon)
          ],
        )
      ]),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
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
            borderRadius: BorderRadius.circular(20), color: pokemon.color),
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
    return Text(text,
        style: TextStyle(color: color, fontWeight: fontWeight, fontSize: size));
  }

  Widget firstRowDetail(Pokemon pokemon, List<String> headers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            child: Column(
          children: <Widget>[
            setTextContent(
                pokemon.spawnTime, pokemon.color, FontWeight.bold, 25.0),
            setTextContent('Spawn', pokemon.color, FontWeight.bold, 19.0),
          ],
        )),
        Container(
            child: Column(
          children: <Widget>[
            setTextContent(
                pokemon.height, pokemon.color, FontWeight.bold, 25.0),
            setTextContent('Height', pokemon.color, FontWeight.bold, 19.0),
          ],
        )),
        Container(
            child: Column(
          children: <Widget>[
            setTextContent(
                pokemon.weight, pokemon.color, FontWeight.bold, 25.0),
            setTextContent('Weight', pokemon.color, FontWeight.bold, 19.0),
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
            setTextContent('Spawn', pokemon.color, FontWeight.bold, 19.0),
          ],
        )),
        Container(
            child: Column(
          children: <Widget>[
            setTextContent(
                pokemon.height, pokemon.color, FontWeight.bold, 25.0),
            setTextContent('Height', pokemon.color, FontWeight.bold, 19.0),
          ],
        )),
        Container(
            child: Column(
          children: <Widget>[
            setTextContent(
                pokemon.weight, pokemon.color, FontWeight.bold, 25.0),
            setTextContent('Weight', pokemon.color, FontWeight.bold, 19.0),
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
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: list);
  }
}
