import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_teste_tecnico/modules/home/widgets/movie_card.dart';
import 'package:the_movie_teste_tecnico/providers/app_provider.dart';
import 'package:the_movie_teste_tecnico/shared/components/navigation.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    // Chama o controller assim que a tela for carregada
    Future.microtask(() {
      ref.read(movieControllerProvider.notifier).getMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final movieState = ref.watch(movieControllerProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(26, 26, 26, 1),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: movieState.when(
              data: (movies) => ListView(
                padding: const EdgeInsets.only(top: 40, bottom: 80),
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Filmes Populares',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...movies.map(
                    (movie) => MovieCard(
                      title: movie.title,
                      duration:
                          'Duração não disponível', // ou use se tiver no model
                      rating: (movie.voteAverage * 10).toInt(),
                    ),
                  ),
                ],
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(
                child: Text(
                  'Erro ao carregar filmes: $err',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),

          // Navegação flutuante
          const Positioned(
            left: 0,
            right: 0,
            bottom: 26,
            child: Navigation(activeTab: NavigationTab.home),
          ),
        ],
      ),
    );
  }
}
