import 'package:flutter/material.dart';
import 'package:the_movie_teste_tecnico/modules/home/home_page.dart';
import 'package:the_movie_teste_tecnico/modules/search/search_page.dart';

enum NavigationTab { home, search }

class Navigation extends StatelessWidget {
  final NavigationTab activeTab;

  const Navigation({super.key, required this.activeTab});

  @override
  Widget build(BuildContext context) {
    const Color activeColor = Colors.blue;
    const Color iconColor = Colors.white;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            children: [
              // Botão HOME
              GestureDetector(
                onTap: () {
                  if (activeTab != NavigationTab.home) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  }
                },
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: activeTab == NavigationTab.home
                        ? activeColor
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.home_outlined,
                    color: iconColor,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Botão SEARCH
              GestureDetector(
                onTap: () {
                  if (activeTab != NavigationTab.search) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SearchPage()),
                    );
                  }
                },
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: activeTab == NavigationTab.search
                        ? activeColor
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.search,
                    color: iconColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
