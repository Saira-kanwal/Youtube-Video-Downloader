import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_video_ownloader/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Uri _url = Uri.parse('https://www.linkedin.com/in/saira-rao/');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  void initState() {
    _statTimer();
    super.initState();
  }
  _statTimer()
  {
    Future.delayed(const Duration(seconds: 5),_openScreen );
  }
  _openScreen()
  {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              Container(
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Image.asset('assets/images/background.png'),
              ),
              const Spacer(),
              const Text('©2023 Flutter Developer,',
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),),
              TextButton.icon(
                  onPressed: (){
                    _launchUrl();
                  },
                  icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
                label: const Text("Saira Kanwal",style: TextStyle(color: Colors.black,fontSize: 15),)
              ),
              const SizedBox(height: 10)

            ],
          )
        ),
      ),
    );
  }
}
