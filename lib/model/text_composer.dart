import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class TextComposer extends StatefulWidget {
  TextComposer(this.sendMessage);

  final Function({String text, File img}) sendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  @override
  // ignore: override_on_non_overriding_member
  final TextEditingController _controllerText = TextEditingController();

  bool _isComposing = false;

  void _reset() {
    _controllerText.clear();
    setState(() {
      _isComposing = false;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: () async {
                  // ignore: deprecated_member_use
                  XFile img =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  if (img == null) return;
                  widget.sendMessage(img: File(img.path));
                },
                icon: Icon(Icons.photo_camera)),
            Expanded(
              child: TextField(
                controller: _controllerText,
                decoration:
                    InputDecoration.collapsed(hintText: "Enviar uma mensagem"),
                onChanged: (text) {
                  setState(() {
                    _isComposing = text.isNotEmpty;
                  });
                },
                onSubmitted: (text) {
                  widget.sendMessage(text: text);
                  _reset();
                },
              ),
            ),
            IconButton(
                onPressed: _isComposing
                    ? () {
                        widget.sendMessage(text: _controllerText.text);
                        _reset();
                      }
                    : null,
                icon: Icon(Icons.send))
          ],
        ));
  }
}
