import 'package:flutter/material.dart';
import 'package:the_movie_teste_tecnico/modules/home/home_page.dart';
import 'package:the_movie_teste_tecnico/modules/search/search_page.dart';

enum NavigationTab { home, search }

class Navigation extends StatelessWidget {
  final NavigationTab activeTab;

  const Navigation({super.key, required this.activeTab});

  @override
  Widget build(BuildContext context) {
    Color activeColor = Colors.blueAccent;
    Color inactiveColor = Colors.white;

    return Positioned(
      left: 0,
      right: 0,
      bottom: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2E),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (activeTab != NavigationTab.home) {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const HomePage()),
                      );
                    }
                  },
                  child: Icon(
                    Icons.home,
                    color: activeTab == NavigationTab.home
                        ? activeColor
                        : inactiveColor,
                  ),
                ),
                const SizedBox(width: 32),
                GestureDetector(
                  onTap: () {
                    if (activeTab != NavigationTab.search) {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const SearchPage()),
                      );
                    }
                  },
                  child: Icon(
                    Icons.search,
                    color: activeTab == NavigationTab.search
                        ? activeColor
                        : inactiveColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
