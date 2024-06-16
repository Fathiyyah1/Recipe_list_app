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

    var uri1 = Uri.https('yummly2.p.rapidapi.com', '/feeds/search',
        {'limit': '24', 'start': '0'});

    final response = await http.get(uri, headers: {
      'x-rapidapi-key': '37373ffb6cmsh9b25211f7bd423ap17eb7djsn3ef767d4d809',
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'useQueryString': 'true',
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
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
      return data.map((recipe) => Recipe.fromJson(recipe)).toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
