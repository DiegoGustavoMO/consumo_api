import 'package:consumo_api/api/movie.dart';

//esta clase es usada para procesar del archivo json la lista de Movies
//aqui procesamos la lista de peliculas

//la finalidad de esta clase es extraer del json los objetos y ponerlos
//en una lista
class Movies {
  //constructor vacio
  Movies();

  //metodo estatico de clase que retorna una lista
  //el metodo fromJsonList(lista dinamica  jsonList) recibe como parametro una lista dinamica de tipos de datos diferentes llamada jsonList
  static List<Movie> fromJsonList(List<dynamic> jsonList) {
    //se crea una lista para agregar los datos (peliculas) por medio de un for , ya que se recorre la lista dinamica y se guarda en lista Peliculas
    List<Movie> listaPeliculas = [];
    if (jsonList != null) {
      for (var pelicula in jsonList) {
        //recorro la lista y extraigo las peliculas de jsonlist
        final movie = Movie.fromJson(pelicula);
        //la pelicula extraida se agrega a la listaPeliculas
        listaPeliculas.add(movie);
      }
    }
    return listaPeliculas;
  }
}
