
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/Model/MoviesModel.dart';
import 'package:flutter_mvvm/Services/Webservice.dart';

class MovieListVM with ChangeNotifier{
  List<MovieViewModel> movies;

  Future<void> fetchTopMovies() async{
    final movies = await Webservice().fetchMovies();
    this.movies = movies.map((movie) => MovieViewModel(movie)).toList();
    notifyListeners();
  }
}

class MovieViewModel{
  
  final Results movie;

  MovieViewModel(this.movie);
  

  String get artistName{
    return this.movie.artistName;
  }
  String get id{
    return this.movie.id;
  }
  String get releaseDate{
    return this.movie.releaseDate;
  }
  String get name{
    return this.movie.name;
  }
  String get kind{
    return this.movie.kind;
  }
  String get copyright{
    return this.movie.copyright;
  }
  String get artworkUrl100{
    return this.movie.artworkUrl100;
  }
  String get url{
    return this.movie.url;
  }
  String get artistId{
    return this.movie.artistId;
  }
  String get artistUrl{
    return this.movie.artistUrl;
  }


}


  




  

