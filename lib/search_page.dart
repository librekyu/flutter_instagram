import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Search Page'),
    );
  }

  Widget _buildBody() {
    return GridView.builder(
      // 고정된 개수의 그리드 레이아웃을 만들어주는 delegate
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildListItem(context, index);
      },
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Container(
        child: FlatButton(
      padding: EdgeInsets.all(3),
      onPressed: () => _clickGridItem(index),
      child: Image.network(
          'https://www.ferzkopp.net/Personal/FunStuff/Pictures/any.jpg',
          fit: BoxFit.cover),
    ));
  }

  _clickGridItem(int index) {
    Fluttertoast.showToast(msg: index.toString());
  }
}
