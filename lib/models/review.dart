import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String id;
  final String author;
  final String playerId;
  final double rating;
  final String title;
  final String content;

  Review({
    required this.id,
    required this.author,
    required this.playerId,
    required this.rating,
    required this.title,
    required this.content,
  });

  factory Review.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Review(
      id: doc.id,
      author: data['author'] ?? '',
      playerId: data['playerId'] ?? '',
      rating: (data['rating'] ?? 0).toDouble(),
      title: data['title'] ?? '',
      content: data['content'] ?? '',
    );
  }
}
