
import 'package:flutter/material.dart';
import 'package:youtube_video_ownloader/screens/downloading_page.dart';
import 'package:youtube_video_ownloader/screens/web_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int  _currentIndex = 0;

  List<Widget> pages =  [
    const DownloadingPage(),
    const WebViewPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.red,
        currentIndex: _currentIndex,
        onTap: (val){
          setState(() {
            _currentIndex = val;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.download),
            label: "Download",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.youtube),
            label: "Youtube",
          )
        ],
      ),
    );
  }
}
