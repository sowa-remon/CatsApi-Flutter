import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Gatitos/models/cat_model.dart';

class CatProvider {
  String _url = 'api.thecatapi.com';
  String _api_key = 'live_mcwGebtrOoyL9hbpWE8Iin8EC0QpbzCjg3clI1Dj0pSUShpELIdmu6DhubWHH6Jt';
  int _limit = 2; // * CAMBIAR LUEGO XD

  List<Cat> _cats = [];

  // Declaramos el controlador del stream
  final _catStreamController = StreamController<List<Cat>>.broadcast();

  // Método para cerrar el stream
  void disposeStream() {
    _catStreamController.close();
  }

  // Funcion que hace el sink (inserta data al stream)
  Function(List<Cat>) get catSink => _catStreamController.sink.add;

  // Funcion que escucha la data del stream
  Stream<List<Cat>> get catStream => _catStreamController.stream;

  // Método que hace peticion a la api catApi
  Future<List<Cat>> getCats() async {
    // Creamos la URL de la peticion
    final url = Uri.https(_url, '/v1/images/search', {'api_key': _api_key, 'limit': _limit.toString(), 'has_breeds':'1'});

    // Obtenemos la resp
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final cats = Cats.fromJsonList(decodedData);

    // Obtener una lista de objetos Future<List<Cat>>
    final allCatsFutures = cats.items.map((cat) => getCatInfo(cat)).toList();

    // Esperar a que se completen todas las llamadas a getCatInfo()
    final allCatsLists = await Future.wait(allCatsFutures);

    return allCatsLists;
  }

  Future<Cat> getCatInfo(Cat cat) async {
    final allInfoUrl = Uri.https(_url, '/v1/images/${cat.id}');

    // Obtener resp
    final resp = await http.get(allInfoUrl);
    final decodedData = json.decode(resp.body);
    final catAllInfo = Cat.fromJsonMap(decodedData);

    return catAllInfo;
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
