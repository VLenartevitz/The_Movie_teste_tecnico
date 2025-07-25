import 'package:flutter/material.dart';
import 'package:the_movie_teste_tecnico/shared/components/navigation.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: Stack(
        children: [
          // Conteúdo principal com scroll

          // Navegação flutuante
          Navigation(activeTab: NavigationTab.search)
        ],
      ),
    );
  }
}
