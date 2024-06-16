import 'package:flutter/material.dart';
import 'package:api_series_app/models/recipe.dart'; // Import your recipe model

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: ,
            ),
            Image.network(recipe.images),
            SizedBox(height: 16),
            Text(
              recipe.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Cook Time: ${recipe.totalTime}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Rating: ${recipe.rating}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              recipe
                  .displayName, // Assuming your recipe model has a description
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
