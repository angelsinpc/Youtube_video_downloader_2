import 'package:flutter/material.dart';
import 'package:youtube_downloader/downloader.dart';
import 'package:youtube_downloader/getSharedData.dart';

class PasteLinkPage extends StatefulWidget {
  @override
  _PasteLinkPageState createState() => _PasteLinkPageState();
}

class _PasteLinkPageState extends State<PasteLinkPage> {
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    DataClass().sharedData().then((value) {
      setState(() {
        _textController.text = "";
        _textController.text = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ///Text Form field for pasting the link
            TextFormField(
              controller: _textController,
              decoration:
                  InputDecoration(labelText: "Paste Youtube Video Link..."),
            ),

            ///Download Button for extrating and downloading the link
            GestureDetector(
              onTap: () {
                if (_textController.text.isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("No link pasted")));
                } else {
                  ///Download the video
                  Download().downloadVideo(
                      _textController.text.trim(), "Youtube Downloader");
                }
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                color: Colors.red,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Download Video",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
