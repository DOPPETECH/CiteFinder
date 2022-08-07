import 'package:cite_finder/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      ),
      body: Center(child: Text("Favorites page")),
    );
  }
}
