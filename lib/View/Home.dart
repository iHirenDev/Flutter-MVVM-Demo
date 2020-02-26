import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mvvm/ViewModel/MovieListVM.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() { 
    super.initState();
    Provider.of<MovieListVM>(context,listen: false).fetchTopMovies();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MovieListVM>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Flutter MVVM Demo using Provider')),
      body: _buildUI(vm),
    );
  }

  Widget _buildUI(MovieListVM vm){
      if(vm.movies == null) {
      return Align(child: CircularProgressIndicator());
    } else if(vm.movies.isEmpty) {
      return Align(child: Text("Cannot fetch movies."));
    } else {
      return _movieList(context);
    }
  }

  Widget _movieList(BuildContext context){

    final vm = Provider.of<MovieListVM>(context);
    return ListView.builder(
      itemCount: vm.movies.length,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          leading: Image.network(vm.movies[index].artworkUrl100),
          title: Text(vm.movies[index].name),
          subtitle: Text(vm.movies[index].artistName),
        );
      });
  }
}
