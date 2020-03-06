import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './detail.dart';

Dio dio = new Dio();

class Movielist extends StatefulWidget {
  Movielist({Key key, @required this.mt}) : super(key: key);

  final String mt;
  @override
  _MovielistState createState() {
    return new _MovielistState();
  }
}

class _MovielistState extends State<Movielist> {

  int page = 1;//默认显示第一页
  int pagesize = 10;//每页显示10条数据
  var mlist = [];//电影列表
  var total = 0;//总数据条数

  // @override
  //   bool get wantKeepAlive => true;

  @override
    void initState() {
      super.initState();
      getMovieList();
    }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mlist.length,
      itemBuilder: (BuildContext ctx,int i) {
        var mitem = mlist[i];
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(BuildContext ctx) {
              return new Moviedetail(
                id: mitem['id'],
                title: mitem['title'],
              );
            }));
          },
          child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.black12))
          ),
          child: Row(children: <Widget>[
            Image.network(mitem['images']['small'],width: 130,height: 180,fit: BoxFit.cover,),
            Container(
              padding: EdgeInsets.only(left: 10),
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('电影名称: ${mitem['title']}'),
                  Text('上映年份: ${mitem['year']}年'),
                  Text('电影类型: ${mitem['genres'].join(', ')}'),
                  Text('豆瓣评分: ${mitem['rating']['average']}分')
                ],
              )
            )
          ]),
        ),
        );
      },
    );
  }

  getMovieList() async {
    int offset = (page-1) * pagesize;
    var responsemlist = await dio.get(
      'http://www.liulongbin.top:3005/api/v2/movie/${widget.mt}?start=$offset&count=$pagesize'
    );
    var mlistresult = responsemlist.data;
    setState(() {
      mlist = mlistresult['subjects'];
      total = mlistresult['total'];
    });
  }
}
