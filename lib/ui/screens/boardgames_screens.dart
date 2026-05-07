import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ludoboardgames/data/game_publisher_repository.dart';
import 'package:ludoboardgames/model/game_publisher.dart';
import 'package:ludoboardgames/ui/components/ludo_top_app_bar.dart';

class BoardGamesScreen extends StatefulWidget {
  const BoardGamesScreen({super.key});

  @override
  State<BoardGamesScreen> createState() => _BoardGamesScreenState();
}

class _BoardGamesScreenState extends State<BoardGamesScreen> {
  late List<GamePublisher> gamesPublisher;

  @override
  void initState() {
    super.initState();
    gamesPublisher = getAllGamesPublishers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LudoBGTopBar(
        actions: [
          IconButton(
            onPressed: () {
              // ação
            },
            icon: const Icon(Icons.notifications),
            tooltip: 'Notificações',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 96,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final publisher = gamesPublisher[index];
                    return Chip(label: Text(publisher.name));
                  },
                  separatorBuilder: (_, _) => const SizedBox(width: 16),
                  itemCount: gamesPublisher.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
