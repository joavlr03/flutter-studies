import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/pokemon.dart';
import '../../services/pokemon_service.dart';
import 'game_status.dart';
import 'widgets/correct_content.dart';
import 'widgets/playing_content.dart';
import 'widgets/quiz_top_bar.dart';
import 'widgets/score_board.dart';
import 'widgets/wrong_content.dart';

class PokemonQuizScreen extends StatefulWidget {
  const PokemonQuizScreen({
    super.key,
  });

  @override
  State<PokemonQuizScreen> createState() =>
      _PokemonQuizScreenState();
}

class _PokemonQuizScreenState
    extends State<PokemonQuizScreen> {
  final PokemonService pokemonService =
      PokemonService();

  final TextEditingController answerController =
      TextEditingController();

  final Random random = Random();

  Pokemon? pokemon;

  GameStatus status =
      GameStatus.loading;

  int score = 0;
  int hits = 0;
  int errors = 0;

  String userAnswer = '';
  String? hint;

  @override
  void initState() {
    super.initState();

    loadPokemon();
  }

  @override
  void dispose() {
    answerController.dispose();

    super.dispose();
  }

  Future<void> loadPokemon() async {
    setState(() {
      status =
          GameStatus.loading;

      hint = null;
      userAnswer = '';

      answerController.clear();
    });

    try {
      final id =
          random.nextInt(151) + 1;

      final result =
          await pokemonService
              .getPokemon(id);

      if (!mounted) {
        return;
      }

      setState(() {
        pokemon = result;

        status =
            GameStatus.playing;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            'Não foi possível carregar o Pokémon.',
          ),
        ),
      );
    }
  }

  void checkAnswer() {
    final currentPokemon =
        pokemon;

    if (currentPokemon == null) {
      return;
    }

    final answer =
        answerController.text.trim();

    if (answer.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            'Digite o nome do Pokémon.',
          ),
        ),
      );

      return;
    }

    final normalizedAnswer =
        normalize(answer);

    final normalizedPokemon =
        normalize(
      currentPokemon.name,
    );

    setState(() {
      userAnswer = answer;

      if (normalizedAnswer ==
          normalizedPokemon) {
        status =
            GameStatus.correct;

        hits++;
        score += 10;
      } else {
        status =
            GameStatus.wrong;

        errors++;

        score =
            max(0, score - 5);
      }
    });
  }

  void showHint() {
    final currentPokemon =
        pokemon;

    if (currentPokemon == null) {
      return;
    }

    final firstLetter =
        currentPokemon.name[0]
            .toUpperCase();

    final types =
        currentPokemon.types
            .map(formatName)
            .join(' / ');

    setState(() {
      hint =
          'Começa com "$firstLetter" e possui o tipo $types.';
    });
  }

  String normalize(String value) {
    return value
        .trim()
        .toLowerCase()
        .replaceAll('♀', '-f')
        .replaceAll('♂', '-m')
        .replaceAll(' ', '-');
  }

  String formatName(String name) {
    if (name.isEmpty) {
      return name;
    }

    return '${name[0].toUpperCase()}${name.substring(1)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            QuizTopBar(
              onSkip:
                  status ==
                          GameStatus.loading
                      ? null
                      : loadPokemon,
            ),

            Expanded(
              child:
                  SingleChildScrollView(
                padding:
                    const EdgeInsets.all(
                  16,
                ),
                child: Column(
                  children: [
                    ScoreBoard(
                      score: score,
                      hits: hits,
                      errors: errors,
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    _buildGameCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameCard() {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .surface,
        borderRadius:
            BorderRadius.circular(24),
      ),
      child: AnimatedSwitcher(
        duration:
            const Duration(
          milliseconds: 300,
        ),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    switch (status) {
      case GameStatus.loading:
        return const SizedBox(
          height: 480,
          child: Center(
            child:
                CircularProgressIndicator(),
          ),
        );

      case GameStatus.playing:
        return PlayingContent(
          pokemon: pokemon!,
          controller:
              answerController,
          hint: hint,
          onConfirm:
              checkAnswer,
          onHint:
              showHint,
        );

      case GameStatus.correct:
        return CorrectContent(
          pokemon: pokemon!,
          onNext: loadPokemon,
        );

      case GameStatus.wrong:
        return WrongContent(
          pokemon: pokemon!,
          userAnswer:
              userAnswer,
          onNext: loadPokemon,
        );
    }
  }
}