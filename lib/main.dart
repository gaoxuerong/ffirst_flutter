import 'package:flutter/material.dart';
import './movie/list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '小哥驿站',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHome()
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,child: Scaffold(
      appBar: AppBar(
        title: Text('电影列表'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('gaoxuerong123@gmail.com'),
              accountName: Text('雪荣'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://user-gold-cdn.xitu.io/2019/4/1/169d48ae4f746658?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1') ,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('http://www.icourt.cc/assets/images/cover-img.jpg'),
                )
              )
            ),
            ListTile(
              title: Text('用户反馈'),
              trailing: Icon(Icons.feedback),
              onTap: () {},
              onLongPress: (){},
            ),
            ListTile(
              title: Text('系统设置'),
              trailing: Icon(Icons.settings),
              onTap: () {},
              onLongPress: (){},
            ),
            ListTile(
              title: Text('我要发布'),
              trailing: Icon(Icons.send),
              onTap: () {},
              onLongPress: (){},
            ),
             Divider(),
            ListTile(
              title: Text('注销'),
              trailing: Icon(Icons.exit_to_app),
              onTap: () {},
              onLongPress: (){},
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.black),
        height: 50,
        child:TabBar(
          labelStyle: TextStyle(height: 0,fontSize: 10),
          tabs: <Widget>[
            Tab(icon: Icon(Icons.movie_filter),text: '正在热映',),
            Tab(icon: Icon(Icons.movie_creation),text: '即将上映',),
            Tab(icon: Icon(Icons.local_movies),text: 'Top250',)
          ],),
      ),
      body: TabBarView(children: <Widget>[
        Movielist(mt: 'in_theaters'),
        Movielist(mt: 'coming_soon'),
        Movielist(mt: 'top250'),
      ],),
    ));
  }
}

