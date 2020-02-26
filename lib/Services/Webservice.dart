import 'package:flutter_mvvm/Model/MoviesModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Webservice{

  Future<List<Results>> fetchMovies() async{

      String url = "https://rss.itunes.apple.com/api/v1/au/movies/top-movies/all/50/explicit.json";

      final response = await http.get(url);

      if(response.statusCode == 200){
        final json = jsonDecode(response.body);
        final movieModel = MoviesModel.fromJson(json);
        return movieModel.feed.results;
      }
      else{
        throw Exception("Error fetching movies...");
      }

  }
}