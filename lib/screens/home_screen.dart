import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../api/firebase_api.dart';
import '../models/player.dart';
import '../widgets/player_card.dart';
import 'ad_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseApi = Provider.of<FirebaseApi>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Soccer Players'),
      ),
      body: Column(
        children: [
          const AdBanner(),
          Expanded(
            child: FutureBuilder<List<Player>>(
              future: firebaseApi.getPlayers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No players found.'));
                }

                final players = snapshot.data!;
                return ListView.builder(
                  itemCount: players.length,
                  itemBuilder: (context, index) {
                    return PlayerCard(player: players[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
