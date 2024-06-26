import 'package:api_series_app/models/recipe.api.dart';
import 'package:api_series_app/models/recipe.dart';
import 'package:api_series_app/presentation/recipeDetails.dart';
import 'package:api_series_app/presentation/widgets/recipe_card.dart';
import 'package:api_series_app/presentation/widgets/search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    _recipes = await RecipeApi.fetchRecipes();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Food Recipes'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: RecipeSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RecipeDetailScreen(recipe: _recipes[index]),
                      ),
                    );
                  },
                  child: RecipeCard(
                    title: _recipes[index].name,
                    cookTime: _recipes[index].totalTime,
                    rating: _recipes[index].rating.toString(),
                    thumbnailUrl: _recipes[index].images,
                  ),
                );
              },
            ),
    );
  }
}
