import 'package:flutter/material.dart';
import 'package:consumo_api/api/movie.dart';
import 'package:consumo_api/UI/pelicula.dart';

//ESTA SERIA COMO LA CLASE VISTA
//la carpeta ui maneja la parte de widgets adicionales y la interfaz de usuario

//creamos una clase cajaPelicula que hereda de stalesswidget
//es decir no tiene cambios

//cajaPelicula sera un widget que se usara en el main.dart
class CajaPelicula extends StatelessWidget {
  //declaro la clase Movie para pasar como parametro
  Movie peli;
//declaro el contructor de CajaPelicula con parametro para pasarle
//un objeto de la clase Movie
  CajaPelicula({required this.peli});

//redefino
  @override
  Widget build(BuildContext context) {
    //retorno un ListTile para llenar el ListView
    return ListTile(
      //en el titulo pongo el titulo de la pelicula
      title: Text(this.peli.title),
      //como subtitulo las valoraciones de la pelicula
      subtitle: Text(this.peli.voteAverage.toString() +
          " (" +
          this.peli.voteCount.toString() +
          ")"),
      //para poner la imagen de la pelicula ponemos trailing y llamamos
      //al widget Image con .network porquela traemos de forma remota
      trailing: Image.network(this.peli.getImage()),
      //cuando le den a la imagen entonces
      onTap: () {
        //al dar a la imagen navego
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Pelicula(movie: this.peli)));
      },
    );
  }
}
