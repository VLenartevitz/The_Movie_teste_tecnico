import 'dart:io'; // para SocketException
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
    Future.microtask(() {
      ref.read(movieControllerProvider.notifier).getMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final movieState = ref.watch(movieControllerProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(26, 26, 26, 1),
      body: SafeArea(
        child: Stack(
          children: [
            movieState.when(
              data: (movies) => ListView(
                padding: const EdgeInsets.only(top: 24),
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
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isWide = constraints.maxWidth > 600;

                      if (isWide) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: movies.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 3.5,
                            ),
                            itemBuilder: (context, index) {
                              final movie = movies[index];
                              return MovieCard(
                                title: movie.title,
                                rating: (movie.voteAverage * 10).toInt(),
                                posterPath: movie.posterPath,
                              );
                            },
                          ),
                        );
                      } else {
                        return Column(
                          children: [
                            ...movies.map(
                                  (movie) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                child: MovieCard(
                                  title: movie.title,
                                  rating: (movie.voteAverage * 10).toInt(),
                                  posterPath: movie.posterPath,
                                ),
                              ),
                            ),
                            const SizedBox(height: 100),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) {
                // Verifica se é erro de internet
                final isNoInternet = err is SocketException;

                final errorMessage = isNoInternet
                    ? 'Sem conexão com a internet.\nPor favor, verifique sua rede e tente novamente.'
                    : 'Erro ao carregar filmes: $err';

                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      errorMessage,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),

            const Positioned(
              left: 0,
              right: 0,
              bottom: 26,
              child: Navigation(activeTab: NavigationTab.home),
            ),
          ],
        ),
      ),
    );
  }
}
