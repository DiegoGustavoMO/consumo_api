//los staless widgets es un widget sin estado, facil de ententer
//ya que es un widget que no cambia por ejemplo un Button o un Text

//los stateful son widgets con estado dinamico que por ejemplo pueden
//cambiar su apariencia en respuesta e eventos por interaccion
//del usuario o cuanto este recibe datos

//el widget container seria referencia a contenedor o una caja lo que
//seria un div en html

//los estados manejados en Flutter son: setState,BloC,ValueNotifier,Provider
import 'package:flutter/material.dart';
import 'package:consumo_api/api/themoviedbservice.dart';
import 'package:consumo_api/ui/spinnerwidget.dart';
import 'package:consumo_api/ui/cajapelicula.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Para quitar el banner de debug
      debugShowCheckedModeBanner: false,
      title: 'Ejemplo API peliculas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieDBPage(),
    );
  }
}

//se crea un widget para cargar en el home
//se crea aparte para no tener tanto codigo encima
class MovieDBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Pelicula mejor valoradas')),
        body: FutureBuilder(
          //con el widget futureBuilder es que trabajamos los metodos
          //asincronos y el manejo de la API

          //si quisiera tener unos datos por defecto si no hay respuesta
          //podria colocar una lista vacia
          //initialData:[]

          //aqui llamamos al metodo estatico de TheMovieDBService

          future: TheMovieDBService.getTopRatedMovies(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            //aqui el builder: tiene como parametros el contexto
            //y una imagen instantanea de lo que se solicita y sera asincrono

            //si hay datos
            if (snapshot.hasData) {
              //retorno un widget visor de lista
              return ListView.builder(
                //defino el numero de objetos de la lista
                //con length saco el tamaño de los datos
                itemCount: snapshot.data!.length,
                //defino el metodo para Construirse el Contexto
                //y el indice que va recorriendo
                itemBuilder: (context, index) {
                  //los datos de snapshot.data en la posicion index
                  //se van almacenando en la variable pelicula
                  //el data! es para asegurar que no sean valores nulos
                  var pelicula = snapshot.data![index];
                  //retorno un widget para luego hacer el listile
                  return CajaPelicula(peli: pelicula);
                },
              );
            } else {
              //si no hay datos entonces muestre un spinnerwidget
              //es decir una figura de carga para que el usuario
              //piense que esta cargando los datos XD
              return SpinnerWidget();
            }
          },
        ));
  }
}
