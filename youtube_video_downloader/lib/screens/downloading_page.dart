import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../downloader.dart';

class DownloadingPage extends StatefulWidget {

  const DownloadingPage({Key? key, }) : super(key: key);

  @override
  State<DownloadingPage> createState() => _DownloadingPageState();
}

class _DownloadingPageState extends State<DownloadingPage> {
  final TextEditingController _textController = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return
      Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.orange])
        ),
        child: Scaffold(
        backgroundColor: Colors.transparent,

            body: ListView(
             padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 20),
              children: [
            const SizedBox(height: 50,),
            TextFormField(
              controller: _textController,
              onTap: (){

              },
              decoration: InputDecoration(
                  focusedBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                  ),

                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: FaIcon(FontAwesomeIcons.paste, color: Colors.white,),
                  ),
                  labelText: "Paste Youtube Video Link",
                labelStyle: const TextStyle(color: Colors.white,fontSize: 20)
              ),
            ),
            const SizedBox(height: 10,),
            //Download Button for extracting and downloading the link
            GestureDetector(
              onTap: () {
                if (_textController.text.isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("No link pasted")));
                } else {
                  //Download the video
                  Download().downloadVideo(
                      _textController.text.trim(), "Youtube Downloader");
                }
                _textController.clear();
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient:  LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.red.shade600, Colors.orange.shade800]),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: const Text(
                  "Download Video",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 50,),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                color: Colors.transparent
              ),
              child: const Image(image: AssetImage('assets/images/splash.png'),),
            ),

          ],
        )
    ),
      );
  }
}

