import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePage createState() => _FavouritePage();
}

class _FavouritePage extends State<FavouritePage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Favourites'),
        ),
      );
}
