import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:aa3_consumo_api/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) { // Shop
        Navigator.pushNamed(context, '/categories');
      }
      // Puedes agregar más condiciones para otros índices si tienes más elementos en el BottomNavigationBar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: CachedNetworkImage(
            imageUrl: 'https://mrshoes.com.pe/wp-content/uploads/2024/06/DQ8563-101-1-350x259.jpg',
            fit: BoxFit.cover,
            width: 150,
            height: 150,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          onPressed: () {},
        ),
        title: const Text('UnisexStyle'),
      ),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Bienvenido de nuevo',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'DancingScript'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Últimos productos',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ProductCard(
                  imageUrl: 'https://assets.adidas.com/images/w_600,f_auto,q_auto/4eb83ceb9a9c405aa7d5ad6a00bce996_9366/Zapatillas_Courtphase_Negro_GX5948_01_standard.jpg',
                  category: 'Ropa',
                  productName: 'Producto 1',
                  initialRating: 4.0,
                  onRatingUpdate: (rating) {
                    print('Rating is: $rating');
                  },
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Más vendidos',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ProductCard(
                  imageUrl: 'https://assets.adidas.com/images/w_600,f_auto,q_auto/4eb83ceb9a9c405aa7d5ad6a00bce996_9366/Zapatillas_Courtphase_Negro_GX5948_01_standard.jpg',
                  category: 'Ropa',
                  productName: 'Producto 1',
                  initialRating: 4.0,
                  onRatingUpdate: (rating) {
                    print('Cambio: $rating');
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
        ],
      ),
    );
  }
}
