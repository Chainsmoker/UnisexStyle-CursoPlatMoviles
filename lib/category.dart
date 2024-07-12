import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final List<Category> categories = [
    Category('Electronics', 12, Icons.devices),
    Category('Books', 34, Icons.book),
    Category('Clothing', 24, Icons.shopping_bag),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryTile(category: categories[index]);
        },
      ),
    );
  }
}

class Category {
  final String name;
  final int productCount;
  final IconData icon;

  Category(this.name, this.productCount, this.icon);
}

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({required this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(category.icon),
      title: Text(category.name),
      trailing: Text('${category.productCount} Product${category.productCount > 1 ? 's' : ''}'),
      onTap: () {
        // Aquí puedes agregar la lógica para navegar a otra pantalla
      },
    );
  }
}
