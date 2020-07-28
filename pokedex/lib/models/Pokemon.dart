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

  Pokemon({
    this.id,
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
  });
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

/*enum TypePok {
  FIRE,
  ICE,
  FLYING,
  PSYCHIC,
  WATER,
  GROUND,
  ROCK,
  ELECTRIC,
  GRASS,
  FIGHTING,
  POISON,
  BUG,
  FAIRY,
  GHOST,
  DARK,
  STEEL,
  DRAGON,
  NORMAL
}*/
