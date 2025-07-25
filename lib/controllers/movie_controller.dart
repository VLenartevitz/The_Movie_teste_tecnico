import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_teste_tecnico/models/movie_model.dart';
import 'package:the_movie_teste_tecnico/providers/app_provider.dart';
import 'package:the_movie_teste_tecnico/repositories/movie_repository.dart';

class MovieController extends AsyncNotifier<List<Movie>> {
  late final MovieRepository _repository;

  @override
  Future<List<Movie>> build() async {
    _repository = ref.read(movieRepositoryProvider);
    return _repository.getMovies();
  }

  Future<void> getMovies() async {
    state = const AsyncLoading();
    try {
      final results = await _repository.getMovies();
      state = AsyncData(results);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
