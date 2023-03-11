import 'package:flutter/material.dart';
import 'package:Gatitos/models/cat_model.dart';

class CatDetail extends StatelessWidget {
  const CatDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Cat cat = ModalRoute.of(context)!.settings.arguments as Cat;
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            _getId(cat),
          ],
        ),
        /*
        child: CustomScrollView(
          slivers: [
            _crearAppBar(pelicula),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: 20,
                  ),
                  _crearFecha(pelicula),
                  _crearAvgVote(pelicula),
                  _crearLanguage(pelicula),
                  _crearSinopsis(pelicula),
                ],
              ),
            )
          ],
        ),*/
      ),
    );
  }

  Widget _getId(Cat cat) {
    return Text(cat.id.toString());
  }

  /*
  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2,
      backgroundColor: Colors.blue,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/images/loading.gif'),
          image: NetworkImage(
            pelicula.getBackdropPath(),
          ),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _crearFecha(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: Text(
        'FECHA DE SALIDA: \r\n' + pelicula.releaseDate.toString(),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _crearSinopsis(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: Text(
        'SINOPSIS: \r\n' + pelicula.overview.toString(),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _crearAvgVote(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: Text(
        'PROMEDIO DE VOTOS: \r\n' + pelicula.voteAverage.toString(),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _crearLanguage(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: Text(
        'Idioma Original: \r\n' + pelicula.originalLanguage.toString(),
        textAlign: TextAlign.center,
      ),
    );
  }*/
}
