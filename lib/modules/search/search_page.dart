import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_teste_tecnico/providers/app_provider.dart';
import 'package:the_movie_teste_tecnico/shared/components/navigation.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final SearchController _searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    final movieState = ref.watch(movieControllerProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(26, 26, 26, 1),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0, bottom: 100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Busca',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                SearchBar(
                  controller: _searchController,
                  hintText: 'Buscar filmes',
                  backgroundColor: WidgetStateProperty.all(const Color(0xFF2C2C2E)),
                  hintStyle: WidgetStateProperty.all(TextStyle(color: Colors.grey[400])),
                  textStyle: WidgetStateProperty.all(const TextStyle(color: Colors.white)),
                  leading: const Icon(Icons.search, color: Colors.white70),
                  onSubmitted: (String value) {
                    ref.read(movieControllerProvider.notifier).searchMovies(value);
                    FocusScope.of(context).unfocus(); // Esconde o teclado
                  },
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: movieState.when(
                    data: (movies) {
                      if (_searchController.text.isEmpty) {
                        return const Center(
                          child: Text(
                            "Digite algo para buscar filmes.",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }

                      if (movies.isEmpty) {
                        return const Center(
                          child: Text("Nenhum filme encontrado", style: TextStyle(color: Colors.white)),
                        );
                      }

                      return ListView.separated(
                        itemCount: movies.length,
                          separatorBuilder: (_, __) => const Divider(
                            color: Colors.white24,
                            thickness: 0.4,
                            height: 16,
                            indent: 4,
                            endIndent: 4,
                          ),

                          itemBuilder: (context, index) {
                            final movie = movies[index];
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Poster do filme
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w92${movie.posterPath}',
                                    width: 32,
                                    height: 32,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => Container(
                                      width: 32,
                                      height: 32,
                                      color: Colors.grey[800],
                                      child: const Icon(Icons.broken_image, color: Colors.white54),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Título
                                Expanded(
                                  child: Text(
                                    movie.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                      );
                    },
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (error, _) => Center(
                      child: Text(
                        'Erro ao buscar filmes: $error',
                        style: const TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 26,
            child: Navigation(activeTab: NavigationTab.search),
          ),
        ],
      ),
    );
  }
}
