import 'package:flutter/material.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    required this.image,
    required this.title,
    required this.description,
    super.key,
  });
  
  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      leading: Image.network(image),
    );
  }
}
