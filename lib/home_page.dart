import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final FirebaseUser user;

  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Instagram',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      )),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: SafeArea(                /// SafeArea: 아이폰 상단에 화면의 가려짐을 구역을 막기위해 패딩을 추가하는 위젯
            child: SingleChildScrollView(     /// SingleChildScrollView: 스크롤이 필요한 차일드를 가지는 컬럼 등의 요소를 감싸는데 사용됨.
                child: Center(
                    child: Column(
          children: <Widget>[
            Text(
              'Instagram에 오신 것을 환영합니다.',
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            Text('사진과 동영상을 보려면 팔로우 하세요.'),
            Padding(padding: EdgeInsets.all(16.0)),
            SizedBox(
              width:260.0,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10.0,          // 그림자 깊이
                    child: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(12.0)),
                          SizedBox(
                            width: 80.0,
                            height: 80.0,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(user.photoUrl),
                            )
                          ),
                          Padding(padding: EdgeInsets.all(8.0)),
                          Text(user.email),
                          Text(user.displayName),
                          Padding(padding: EdgeInsets.all(8.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: Image.network('https://www.ferzkopp.net/Personal/FunStuff/Pictures/any.jpg', fit: BoxFit.cover)
                              ),
                              Padding(padding: EdgeInsets.all(1.0)),
                              SizedBox(
                                  width: 70.0,
                                  height: 70.0,
                                  child: Image.network('https://www.ferzkopp.net/Personal/FunStuff/Pictures/any.jpg', fit: BoxFit.cover)
                              ),
                              Padding(padding: EdgeInsets.all(1.0)),
                              SizedBox(
                                  width: 70.0,
                                  height: 70.0,
                                  child: Image.network('https://www.ferzkopp.net/Personal/FunStuff/Pictures/any.jpg', fit: BoxFit.cover)
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(4.0)),
                          Text('Facebook 친구'),
                          Padding(padding: EdgeInsets.all(4.0)),
                          RaisedButton(
                              child: Text('팔로우'),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            onPressed: () {},
                          ),
                          Padding(padding: EdgeInsets.all(4.0)),
                        ])),
              ),

            )
          ],
        ))))
        );
  }
}
