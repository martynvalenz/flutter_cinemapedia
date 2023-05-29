import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigation({
    super.key, 
    required this.currentIndex
  });

  void onItemTapped(BuildContext context, int index){
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      case 3:
        context.go('/home/3');
        break;
      default: context.go('/home/0');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      elevation:0,
      currentIndex: currentIndex,
      onTap:(index) => onItemTapped(context, index),
      selectedItemColor: colors.primary,
      unselectedItemColor: colors.onSurface,
      items:const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label:'Estrenos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.new_releases),
          label:'Próximamente',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up),
          label:'Populares',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label:'Favoritos',
        ),
      ]
    );
  }
}