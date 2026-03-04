import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../api/firebase_api.dart';
import '../models/review.dart';

class AddReviewScreen extends StatefulWidget {
  final String playerId;

  const AddReviewScreen({super.key, required this.playerId});

  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final _formKey = GlobalKey<FormState>();
  final _authorController = TextEditingController();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  double _rating = 3.0;

  @override
  void dispose() {
    _authorController.dispose();
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _submitReview() {
    if (_formKey.currentState!.validate()) {
      final review = Review(
        id: '', // Dummy ID, Firestore will generate one
        author: _authorController.text,
        playerId: widget.playerId,
        rating: _rating,
        title: _titleController.text,
        content: _contentController.text,
      );
      Provider.of<FirebaseApi>(context, listen: false).addReview(review);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _authorController,
                decoration: const InputDecoration(labelText: 'Your Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Review Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Review Content'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your review';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              const Text('Rating', style: TextStyle(fontSize: 16)),
              Slider(
                value: _rating,
                min: 1,
                max: 5,
                divisions: 4,
                label: _rating.toStringAsFixed(1),
                onChanged: (value) {
                  setState(() {
                    _rating = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitReview,
                child: const Text('Submit Review'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
