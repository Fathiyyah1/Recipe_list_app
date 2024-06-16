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

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'] ?? 'Unknown',
      images: json['images'] != null && json['images'].isNotEmpty
          ? json['images'][0]['hostedLargeUrl'] as String
          : 'https://example.com/default_image.png',
      rating: json['rating'] != null ? (json['rating'] as num).toDouble() : 0.0,
      totalTime: json['totalTime'] ?? 'N/A',
      displayName: json['displayName'] ?? 'Unknown',
      directionsUrl: json['directionsUrl'] ?? '',
    );
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
