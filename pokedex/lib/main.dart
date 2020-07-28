import 'package:flutter/material.dart';
import 'package:pokedex/providers/PokemonProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonProvider = new PokemonProvider();

    //pokemonProvider.getPokemon();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      home: Scaffold(
        body: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                      Color(0xFFEF5350),
                      Color(0xFFEF5350),
                    ])),
              ),
            ),
            Container(
              height: 500.0,
              width: 350.0,
              child: FutureBuilder(
                future: pokemonProvider.getPokemon(),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, crossAxisSpacing: 10.0),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 100.0,
                          width: 30.0,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.2,
                                ),
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.center,
                                    colors: [
                                      Color(0xFFEF5350),
                                      Colors.white,
                                    ])),
                            child: Column(
                              children: <Widget>[
                                FadeInImage(
                                  placeholder:
                                      AssetImage('assets/img/no-image.jpg'),
                                  image: NetworkImage(snapshot.data[index].img),
                                  fit: BoxFit.cover,
                                ),
                                Text(snapshot.data[index].name),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
