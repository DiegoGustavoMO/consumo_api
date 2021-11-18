//esta clase se hace para representar
//los datos que trae la API de peliculas

//esta seria como la clase MODELO
class Movie {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;
//aqui se define un constructor para la clase Movie
  Movie(
      {required this.popularity,
      required this.voteCount,
      required this.video,
      required this.posterPath,
      required this.id,
      required this.adult,
      required this.backdropPath,
      required this.originalLanguage,
      required this.originalTitle,
      required this.genreIds,
      required this.title,
      required this.voteAverage,
      required this.overview,
      required this.releaseDate});

//se define un metodo estatico
//estatico porque es de la misma clase
//este metodo se llama fromJson que tiene
//como parametro un archivo json y que devuelve un objeto de la clase Movie (return Movie)

//los json dependiendo su estructura definen su tipo con listas, o tipo map

//dentro del Map los nombres seran de tipo String y los valores seran dynamic , dynamic porque dejamos que el compilador elija el tipo de datos
//o simplemente porque no sabemos que tipos de datos tenga o porque son conbinaciones de tipos de datos

  static Movie fromJson(Map<String, dynamic> json) {
    return Movie(
      //aqui se llama el constructor y se define para el map
      popularity: (json['popularity'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      video: json['video'] as bool,
      posterPath: json['poster_path'] as String,
      id: json['id'] as int,
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      genreIds: (json['genre_ids'] as List).map((e) => e as int).toList(),
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String,
    );
  }

//un metodo de instancia para traer la imagen de la pelocula
//donde se concatena la imagen y el nombre de la pelicula
  String getImage() {
    return "https://image.tmdb.org/t/p/w500/" + this.posterPath;
  }
}
