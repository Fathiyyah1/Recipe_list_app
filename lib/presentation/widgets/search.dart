import 'package:api_series_app/presentation/recipeDetails.dart';
import 'package:flutter/material.dart';
import 'package:api_series_app/models/recipe.dart';
import 'package:api_series_app/models/recipe.api.dart';
import 'package:api_series_app/presentation/widgets/recipe_card.dart';

class RecipeSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
      future: RecipeApi.searchRecipes(query), // Update your API call here
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No recipes found.'));
        }
        final recipes = snapshot.data!;
        return ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RecipeDetailScreen(recipe: recipes[index]),
                  ),
                );
              },
              child: RecipeCard(
                title: recipes[index].name,
                cookTime: recipes[index].totalTime,
                rating: recipes[index].rating.toString(),
                thumbnailUrl: recipes[index].images,
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
