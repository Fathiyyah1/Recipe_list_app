class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;
  final String displayName;
  final String directionsUrl;

  Recipe({
    required this.name,
    required this.images,
    required this.rating,
    required this.totalTime,
    required this.displayName,
    required this.directionsUrl,
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        images: json['images'] != null
            ? json['images'][0]['hostedLargeUrl'] as String
            : '',
        rating: json['rating'] != null ? json['rating'] as double : 0.0,
        totalTime: json['totalTime'] as String,
        displayName: json['displayName'] as String,
        directionsUrl: json['directionsUrl'] as String);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime, displayName: $displayName, directionsUrl: $directionsUrl}';
  }
}
