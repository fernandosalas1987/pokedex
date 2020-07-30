import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pokemons {
  List<Pokemon> pokemons = new List();

  Pokemons({
    this.pokemons,
  });
  Pokemons.fromJson(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var poke in jsonList) {
      pokemons.add(new Pokemon.fromMapJson(poke));
    }
  }
}

class Pokemon {
  int id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  int candyCount;
  String egg;
  String spawnChance;
  String avgSpawns;
  String spawnTime;
  List<double> multipliers;
  List<String> weaknesses;
  List<Evolution> nextEvolution;
  List<Evolution> prevEvolution;
  Color color;

  Pokemon(
      {this.id,
      this.num,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.candyCount,
      this.egg,
      this.spawnChance,
      this.avgSpawns,
      this.spawnTime,
      this.multipliers,
      this.weaknesses,
      this.nextEvolution,
      this.prevEvolution,
      this.color});
  Pokemon.fromMapJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];

    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    candyCount = json['candy_count'];
    egg = json['json'];
    spawnChance = json['spawn_chance'].toString();
    avgSpawns = json['avg_spawns'].toString();
    spawnTime = json['spawn_time'];
    type = json['type'].cast<String>();
    multipliers = json['multipliers']?.cast<double>();
    weaknesses = json['weaknesses'].cast<String>();
    if (json['next_evolution'] != null) {
      nextEvolution = new List<Evolution>();
      json['next_evolution'].forEach((v) {
        nextEvolution.add(new Evolution.fromJson(v));
      });
    }
    if (json['prev_evolution'] != null) {
      prevEvolution = new List<Evolution>();
      json['prev_evolution'].forEach((v) {
        prevEvolution.add(new Evolution.fromJson(v));
      });
    }
    if (json['type'] != null) {
      type = new List<String>();
      json['type'].forEach((types) {
        type.add(types);
      });
    }
    _getColorPokemon(type[0]);
  }

  _getColorPokemon(String type) {
    switch (type) {
      case 'Normal':
        this.color = Colors.orange[200];
        break;
      case 'Fire':
        this.color = Color.fromRGBO(250, 109, 110, 10);
        break;
      case 'Water':
        this.color = Color.fromRGBO(116, 186, 248, 10.0);
        break;
      case 'Grass':
        this.color = Color.fromRGBO(73, 208, 176, 40.0);
        break;
      case 'Electric':
        this.color = Color.fromRGBO(248, 209, 108, 10.0);
        break;
      case 'Ice':
        this.color = Colors.cyanAccent[400];
        break;
      case 'Fighting':
        this.color = Colors.teal[200];
        break;
      case 'Poison':
        this.color = Colors.purple[200];
        break;
      case 'Ground':
        this.color = Colors.brown[200];
        break;
      case 'Flying':
        this.color = Colors.indigo[200];
        break;
      case 'Psychic':
        this.color = Colors.pink[200];
        break;
      case 'Bug':
        this.color = Colors.lightGreen[300];
        break;
      case 'Rock':
        this.color = Colors.grey;
        break;
      case 'Ghost':
        this.color = Colors.indigo[300];
        break;
      case 'Dark':
        this.color = Color.fromRGBO(177, 115, 109, 10.0);
        break;
      case 'Dragon':
        this.color = Colors.indigo[800];
        break;
      case 'Steel':
        this.color = Colors.blueGrey;
        break;
      case 'Fairy':
        this.color = Colors.pinkAccent[100];
        break;
      default:
        this.color = Colors.grey;
        break;
    }
  }
}

class Evolution {
  String num;
  String name;

  Evolution({
    this.num,
    this.name,
  });
  Evolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }
}
