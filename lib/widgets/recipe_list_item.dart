import 'package:flutter/material.dart';

class RecipeListItem extends StatelessWidget {
  final Map<String, dynamic> recipe;
  final VoidCallback onTap;

  const RecipeListItem({
    super.key,
    required this.recipe,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(recipe['image'],
          width: 50, height: 50, fit: BoxFit.cover),
      title: Text(recipe['title']),
      onTap: onTap,
    );
  }
}
