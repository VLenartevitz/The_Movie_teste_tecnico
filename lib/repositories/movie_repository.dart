import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:the_movie_teste_tecnico/models/movie_model.dart';

class MovieRepository {
  final String _apiKey = 'c2332f209848a5db0a72d8961c8d6ee8';
  final String _baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> getMovies() async {
    final response = await http.get(Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey&language=pt-BR'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List results = jsonData['results'];
      return results.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar filmes populares');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(Uri.parse('$_baseUrl/search/movie?api_key=$_apiKey&language=pt-BR&query=$query'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List results = jsonData['results'];
      return results.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao buscar filmes');
    }
  }
}
