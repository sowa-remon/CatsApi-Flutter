import 'package:flutter/material.dart';
import 'package:gatitos/models/cat_model.dart';
import 'package:gatitos/providers/cat_provider.dart';
import 'package:gatitos/widgets/card_swiper_widget.dart';
import 'package:gatitos/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});

  final catProvider = CatProvider();

  @override
  Widget build(BuildContext context) {
    catProvider.getCats();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gatos'),
        actions: [
          TextButton(onPressed: (){}, style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.white)), child: const Text('Gatos'),),
          TextButton(onPressed: (){}, style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.white)), child: const Text('Favoritos'),)
          // IconButton(
          //   icon: const Icon(Icons.shopping_cart),
          //   tooltip: 'Open shopping cart',
          //   onPressed: () {
          //     // handle the press
          //   },
          // ),
        ],
      ),
      body: _crearLista(),
    );
  }

  // Crear lista
  Widget _crearLista() {
    
    return FutureBuilder(
      future: catProvider.getCats(),
      builder: (context, AsyncSnapshot<List<Cat>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(cats: snapshot.data!);
        } else {
          return Container(
            height: 400,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
  /*
  // Método para crear un swiper
  Widget _crearSwiper() {
    return FutureBuilder(
      future: catProvider.getCats(),
      builder: (context, AsyncSnapshot<List<Cat>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(cats: snapshot.data!);
        } else {
          return Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }*/

  /*
  // Método para crear footer
  Widget _crearFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Peliculas populares:',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: peliculuaProvider.popularesStream,
            builder: (context, AsyncSnapshot<List<Pelicula>> snapshot) {
              //snapshot.data?.forEach((element) => print(element.title));
              if (snapshot.hasData) {
                return MovieHorizontal(
                  peliculas: snapshot.data!,
                  siguientePagina: peliculuaProvider.getPopulares,
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }*/

}
