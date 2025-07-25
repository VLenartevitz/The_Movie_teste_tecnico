import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_teste_tecnico/controllers/movie_controller.dart';
import 'package:the_movie_teste_tecnico/models/movie_model.dart';
import 'package:the_movie_teste_tecnico/repositories/movie_repository.dart';

// Repositório
final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepository();
});

// Controller
final movieControllerProvider =
AsyncNotifierProvider<MovieController, List<Movie>>(MovieController.new);
