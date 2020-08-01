import 'package:flutter/material.dart';

class PokeHelps {
  Color getColorPokemon(String type) {
    switch (type) {
      case 'Normal':
        return Colors.orange[200];
        break;
      case 'Fire':
        return Color.fromRGBO(250, 109, 110, 10);
        break;
      case 'Water':
        return Color.fromRGBO(116, 186, 248, 10.0);
        break;
      case 'Grass':
        return Color.fromRGBO(73, 208, 176, 40.0);
        break;
      case 'Electric':
        return Color.fromRGBO(248, 209, 108, 10.0);
        break;
      case 'Ice':
        return Colors.cyanAccent[400];
        break;
      case 'Fighting':
        return Colors.teal[200];
        break;
      case 'Poison':
        return Colors.purple[200];
        break;
      case 'Ground':
        return Colors.brown[200];
        break;
      case 'Flying':
        return Colors.indigo[200];
        break;
      case 'Psychic':
        return Colors.pink[200];
        break;
      case 'Bug':
        return Colors.lightGreen[300];
        break;
      case 'Rock':
        return Colors.grey;
        break;
      case 'Ghost':
        return Colors.indigo[300];
        break;
      case 'Dark':
        return Color.fromRGBO(177, 115, 109, 10.0);
        break;
      case 'Dragon':
        return Colors.indigo[800];
        break;
      case 'Steel':
        return Colors.blueGrey;
        break;
      case 'Fairy':
        return Colors.pinkAccent[100];
        break;
      default:
        return Colors.grey;
        break;
    }
  }
}
