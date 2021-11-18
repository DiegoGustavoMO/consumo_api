import 'package:flutter/material.dart';

//clase que genera un spinner de carga
// se llama cuando no este cargando los datos
//da la sensacion de carga
class SpinnerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: AlignmentDirectional.bottomCenter,
          child: Column(
            children: <Widget>[CircularProgressIndicator()],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
          )),
    );
  }
}
