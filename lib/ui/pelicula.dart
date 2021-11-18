import 'package:consumo_api/api/movie.dart';
import 'package:flutter/material.dart';

//en este widget Pelicula nos muestra los detalles de la pelicula
class Pelicula extends StatelessWidget {
  Movie movie;
//constructor
//super() define herencia de una clase padre
  Pelicula({required this.movie}) : super();

//redefiniendo el metodo build
  @override
  Widget build(BuildContext context) {
    //retorno un scaffold
    //el scaffold es una pagina con diseño basico en flutter
    return Scaffold(
        appBar: AppBar(
          title: Text(this.movie.title),
        ),
        //aqui se usa lisView en vez de column porque si  la lista excede
        //el tamaño de la pantalla con column sale error
        body: ListView(
          //padding se usa para manejar las margenes
          padding: EdgeInsets.all(15.0),
          //recordar que children se usa para mostra varios widgets
          children: <Widget>[
            //en este children ponemos los widgets de Image y Text
            //en este caso para mostra la imagen y la reseña de la pelicula
            Image.network(this.movie.getImage()),
            Text(this.movie.overview)
          ],
        ));
  }
}
