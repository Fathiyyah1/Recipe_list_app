import 'dart:convert';
import 'package:http/http.dart' as http;
import 'recipe.dart';

// const req = unirest('GET', 'https://yummly2.p.rapidapi.com/feeds/list');

// req.query({
// 	limit: '24',
// 	start: '0'
// });

// req.headers({
// 	'x-rapidapi-key': '37373ffb6cmsh9b25211f7bd423ap17eb7djsn3ef767d4d809',
// 	'x-rapidapi-host': 'yummly2.p.rapidapi.com'
// });

class RecipeApi {
  static Future<List<Recipe>> fetchRecipes() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {'limit': '24', 'start': '0'});

    final response = await http.get(uri, headers: {
      'x-rapidapi-key': '37373ffb6cmsh9b25211f7bd423ap17eb7djsn3ef767d4d809',
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'useQueryString': 'true',
    });
    // final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s='));
    // return Recipe.recipesFromSnapshot(jsonDecode(response.body));
  }
}
