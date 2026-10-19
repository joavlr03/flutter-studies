import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const JoKenPokemonApp());
}

class JoKenPokemonApp extends StatelessWidget {
  const JoKenPokemonApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JoKenPokemon',
      theme: ThemeData(useMaterial3: true),
      home: const JoKenPokemonScreen(),
    );
  }
}

class JoKenPokemonScreen extends StatefulWidget {
  const JoKenPokemonScreen({super.key});
  @override
  State<JoKenPokemonScreen> createState() => _JoKenPokemonScreenState();
}

class _JoKenPokemonScreenState extends State<JoKenPokemonScreen> {
  final List<Pokemon> pokemons = [
    Pokemon(name: 'Charmander', imagePath: 'images/charmander.png'),
    Pokemon(name: 'Bulbasaur', imagePath: 'images/bulbassaur.png'),
    Pokemon(name: 'Squirtle', imagePath: 'images/squirtle.png'),
  ];
  int playerScore = 0;
  int computerScore = 0;

  Pokemon? playerChoice;
  Pokemon? computerChoice;
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child: Column(
          children: [
            PokemonHeader(),
            ScoreBoard(playerScore: playerScore, computerScore: computerScore, onReset:_resetScore ),
            Expanded(
              child: BattleArena(
                result: result,
                playerPokemon: playerChoice,
                enemyPokemon: computerChoice,
              ),
            ),
            PokemonFooter(
              pokemons: pokemons,
              playerChoice: playerChoice,
              onSelected: _play,
            ),
            BattleResult(result: result),
          ],
        ),
      ),
    );
  }

  void _resetScore() {
  setState(() {
    playerScore = 0;
    computerScore = 0;
    playerChoice = null;
    computerChoice = null;
    result = '';
  });
}


  /// Lógica do Jokenpo
  void _play(Pokemon selected) {
    final random = Random();
    final compChoice = pokemons[random.nextInt(pokemons.length)];
    String battleResult;
    if (selected.name == compChoice.name) {
      battleResult = 'Empate!';
    } else if ((selected.name == 'Charmander' &&
            compChoice.name == 'Bulbasaur') ||
        (selected.name == 'Bulbasaur' && compChoice.name == 'Squirtle') ||
        (selected.name == 'Squirtle' && compChoice.name == 'Charmander')) {
      battleResult = 'Você venceu!';
      playerScore++;
    } else {
      battleResult = 'Você perdeu!';
      computerScore++;
    }
    setState(() {
      playerChoice = selected;
      computerChoice = compChoice;
      result = battleResult;
    });
  }
}

class PokemonLogo extends StatelessWidget {
  const PokemonLogo({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Image.asset('images/logo_pokemon.png', height: 200),
    );
  }
}

// Cabecalho da tela
class PokemonHeader extends StatelessWidget {
  const PokemonHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return const PokemonLogo();
  }
}

class ScoreBoard extends StatelessWidget {
  final int playerScore;
  final int computerScore;
   final VoidCallback onReset;

  const ScoreBoard({
    super.key,
    required this.playerScore,
    required this.computerScore,
    required this.onReset,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Jogador: $playerScore",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          IconButton(
           onPressed: onReset,
           icon: const Icon(Icons.refresh),
            ),
          const SizedBox(width: 30),
          Text(
            "Computador: $computerScore",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class PokemonFooter extends StatelessWidget {
  const PokemonFooter({
    super.key,
    required this.pokemons,
    this.playerChoice,
    required this.onSelected,
  });
  final List<Pokemon> pokemons;
  final Pokemon? playerChoice;
  final Function(Pokemon) onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Faça sua jogada de mestre",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Row(
            children: pokemons.map((p) {
              return Expanded(
                child: PokemonOption(
                  selected: playerChoice == p,
                  pokemon: p,
                  onSelected: (pokemon) => onSelected(p),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

/// Modelo Pokémon
class Pokemon {
  final String name;
  final String imagePath;
  Pokemon({required this.name, required this.imagePath});
}

/// Card Pokémon
class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.playerName,
    required this.mirror,
  });
  final Pokemon? pokemon;
  final String playerName;
  final bool mirror;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 3,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(mirror ? 3.14159 : 0),
            child: Image.asset(pokemon!.imagePath, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          pokemon!.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(playerName),
      ],
    );
  }
}

/// Card de batalha inicial
class BattleEmptyState extends StatelessWidget {
  const BattleEmptyState({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.catching_pokemon, size: 80, color: Colors.red),
          SizedBox(height: 16),
          Text(
            "Escolha seu Pokémon para iniciar a batalha!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// RESULTADO DA BATALHA
class BattleResult extends StatelessWidget {
  final String result;
  const BattleResult({super.key, required this.result});
  @override
  Widget build(BuildContext context) {
    Color resultColor;

    if (result == "Você venceu!") {
      resultColor = Colors.green;
    } else if (result == "Você perdeu!") {
      resultColor = Colors.red;
    } else {
      resultColor = Colors.orange;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        result,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: resultColor,
        ),
      ),
    );
  }
}

// Visualizacao da batalha
class BattleView extends StatelessWidget {
  const BattleView({
    super.key,
    required this.playerPokemon,
    required this.enemyPokemon,
    required this.result,
  });
  final Pokemon playerPokemon;
  final Pokemon? enemyPokemon;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: PokemonCard(
                  pokemon: playerPokemon,
                  playerName: "Jogador",
                  mirror: true,
                ),
              ),
              Expanded(
                child: PokemonCard(
                  pokemon: enemyPokemon,
                  playerName: "Computador",
                  mirror: false,
                ),
              ),
            ],
          ),
        ),
        BattleResult(result: result),
      ],
    );
  }
}

class BattleArena extends StatelessWidget {
  const BattleArena({
    super.key,
    required this.playerPokemon,
    required this.enemyPokemon,
    required this.result,
  });
  final Pokemon? playerPokemon;
  final Pokemon? enemyPokemon;
  final String result;

  @override
  Widget build(BuildContext context) {
    if (playerPokemon == null) {
      return const BattleEmptyState();
    }
    return BattleView(
      playerPokemon: playerPokemon!,
      enemyPokemon: enemyPokemon,
      result: result,
    );
  }
}

// Botão de escolha de Pokémon
class PokemonOption extends StatelessWidget {
  final bool selected;
  final Pokemon pokemon;
  final Function(Pokemon) onSelected;
  const PokemonOption({
    super.key,
    required this.selected,
    required this.pokemon,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(pokemon),
      child: Column(
        children: [
          Image.asset(
            selected
                ? "images/pokeball_selected.png"
                : "images/pokeball_unselected.png",
            width: 40,
            height: 40,
          ),
          const SizedBox(height: 4),
          Text(pokemon.name, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
