import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  /// 텍스팅 된 것들을 TextEditingController 객체를 통해 얻어 온다.
  final textEditingController = TextEditingController();
  PickedFile _image;

  /// state 소멸될 때, 메모리 해제.
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.send),
          onPressed: null,
        )
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _image != null ? Image.file(File(_image.path)) : Text('No image'),
          TextField(
            decoration: InputDecoration(hintText: '내용을 입력하세요.'),
            controller: textEditingController,
          )
        ],
      ),
    );
  }

  void _getImage() async {

    try {
      final PickedFile pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
      setState(() {
        _image = pickedImage;
      });
    } catch (exception) {
      print(exception.toString());
    }
  }
}
