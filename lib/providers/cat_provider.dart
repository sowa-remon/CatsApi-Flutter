import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Gatitos/models/cat_model.dart';

class CatProvider {
  String _url = 'api.thecatapi.com';
  int _limit = 10;

  List<Cat> _cats = [];

  // Declaramos el controlador del steam
  final _catStreamController = StreamController<List<Cat>>.broadcast();

  // Método para cerrar el stream
  void disposeStream() {
    _catStreamController.close();
  }

  // Funcion que hace el sink (inserta data al stream)
  Function(List<Cat>) get catSink => _catStreamController.sink.add;

  // Funcion que escucha la data del stream
  Stream<List<Cat>> get catStream => _catStreamController.stream;

  // Método que hace peticion al endpoint now_playing
  Future<List<Cat>> getCats() async {
    // Creamos la URL de la peticion
    final url =
        Uri.https(_url, '/v1/images/search', {'limit': _limit.toString()});

    // Obtenemos la resp
    final resp = await http.get(url);

    // Decodificamos la respuesta
    final decodedData = json.decode(resp.body);

    print(decodedData);
    final cats = new Cats.fromJsonList(decodedData);

    print(cats.items[0].id);

    return cats.items;
  }

  /*
  // Método para obtener peliculas populares
  Future<List<Pelicula>> getPopulares() async {
    _popularesPage++;

    // Creamos la URL de la peticion
    final url = Uri.https(
      _url,
      '3/movie/popular',
      {
        'api_key': _apikey,
        'language': _language,
        'page': _popularesPage.toString()
      },
    );

    // Obtenemos la resp
    final resp = await http.get(url);

    // Decodificamos la respuesta
    final decodedData = json.decode(resp.body);

    print(decodedData['results']);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    print(peliculas.items[0].title);

    final respuesta = peliculas.items;

    _populares.addAll(respuesta);
    popularesSink(_populares);

    return respuesta;
  }*/
}
