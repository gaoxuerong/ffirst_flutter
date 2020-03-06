import 'package:flutter/material.dart';


class Moviedetail extends StatefulWidget {

  Moviedetail({Key key, @required this.id, @required this.title}) : super(key: key);
  final String id;
  final String title;
  @override
  _MoviedetailState createState() {
    return new _MoviedetailState();
  }
}

class _MoviedetailState extends State<Moviedetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Text('电影id为${widget.id}'),
    );
  }
}
