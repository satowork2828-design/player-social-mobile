import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/player.dart';
import '../models/review.dart';

class FirebaseApi {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Player>> getPlayers() async {
    QuerySnapshot snapshot = await _db.collection('players').get();
    return snapshot.docs.map((doc) => Player.fromFirestore(doc)).toList();
  }

  Future<List<Review>> getReviews(String playerId) async {
    QuerySnapshot snapshot = await _db
        .collection('reviews')
        .where('playerId', isEqualTo: playerId)
        .get();
    return snapshot.docs.map((doc) => Review.fromFirestore(doc)).toList();
  }

  Future<void> addReview(Review review) async {
    await _db.collection('reviews').add({
      'author': review.author,
      'playerId': review.playerId,
      'rating': review.rating,
      'title': review.title,
      'content': review.content,
    });
  }
}
