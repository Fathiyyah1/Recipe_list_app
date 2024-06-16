import 'dart:convert';
import 'package:http/http.dart' as http;
import 'recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> fetchRecipes() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {'limit': '24', 'start': '0'});

    final response = await http.get(uri, headers: {
      'x-rapidapi-key': '37373ffb6cmsh9b25211f7bd423ap17eb7djsn3ef767d4d809',
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'useQueryString': 'true',
    });

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List _temp = [];

      for (var i in data['feed']) {
        _temp.add(i['content']['details']);
      }
      return Recipe.recipesFromSnapshot(_temp);
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  static Future<List<Recipe>> searchRecipes(String query) async {
    final response = await http.get(
      Uri.parse(
          'https://yummly2.p.rapidapi.com/feeds/search?q=$query&start=0&maxResult=18'),
      headers: {
        'x-rapidapi-key': '37373ffb6cmsh9b25211f7bd423ap17eb7djsn3ef767d4d809',
        'x-rapidapi-host': 'yummly2.p.rapidapi.com'
      },
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['feed'];
      return data
          .map((recipe) => Recipe.fromJson(recipe['content']['details']))
          .toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
