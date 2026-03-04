import 'package:cloud_firestore/cloud_firestore.dart';

class Player {
  final String id;
  final String name;
  final String team;
  final int age;
  final Map<String, int> stats;
  final String position;
  final String imageUrl;

  Player({
    required this.id,
    required this.name,
    required this.team,
    required this.age,
    required this.stats,
    required this.position,
    required this.imageUrl,
  });

  factory Player.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Player(
      id: doc.id,
      name: data['name'] ?? '',
      team: data['team'] ?? '',
      age: data['age'] ?? 0,
      stats: Map<String, int>.from(data['stats'] ?? {}),
      position: data['position'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }
}
