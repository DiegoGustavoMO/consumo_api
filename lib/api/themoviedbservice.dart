import 'package:consumo_api/api/movies.dart';
import 'package:consumo_api/api/movie.dart';
import 'dart:convert';
//el paquete dart convert es usado para hacer la conversion de los ficheros json
import 'package:http/http.dart' as http;
//el paquete http nos maneja la conexion http para hacer solicitudes
//se suele usar un alias para referirse a este paquete -- as http
// y se llama usando http.

// SERIA COMO LA CLASE DE servicios CON PARTE DE CONTROLADOR
//esta clase es definida para manejar el llamado de la API por http
class TheMovieDBService {
  //primero se define el atributo de la API
  //aqui se divide en 2 la url de la direccion de la pagina
  //y la otra parte la llave o Key de la API
  static final String API_url = "https://api.themoviedb.org/3";
  static final String API_key = "0f6ad6adb51e736cbc2dc98dfe96c70d";
//definimos una clase asincrona de tipo Future llamada getTopRatedMovies
//Future porque tenemos que esperar y hacer peticiones
  static Future<List<Movie>> getTopRatedMovies() async {
    //aqui se define una variable url que arma la direccion de la API
    var url = API_url + "/movie/top_rated?api_key=" + API_key + "&language=es";
    //defino una variable respuesta que espera la respuesta a la peticion
    //de la API
    final respuesta = await http.get(Uri.parse(url));
//aqui se verifica la respuesta y dependiendo el codigo de respuestaJSON
//se dan las opciones
//el codigo 200 en http es que si hay respuesta a la peticion
    if (respuesta.statusCode == 200) {
      //statuscode devuelve una respuesta.body
      //que es decodificada usando json.decode
      //y almacenada en respuestaJSON
      final respuestaJSON = json.decode(respuesta.body);
      //aplicamos un filtro a los datos extraidos
      //y se proces dentro de Movies.fromJsonList donde este results
      //y lo asignamos a peliculasMejorValoradas
      final peliculasMejorValoradas =
          Movies.fromJsonList(respuestaJSON['results']);
      //y ahora si devuelvo el resultado de peliculasMejorValoradas
      return peliculasMejorValoradas;
    }
    //en caso de que la respuesta sea incorrecta entonces devuelvo una lista vacia <Movie>[]
    return <Movie>[];
  }
}
