import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(UrlLauncher());
}
class UrlLauncher extends StatefulWidget {
  const UrlLauncher({ Key? key }) : super(key: key);

  @override
  _UrlLauncherState createState() => _UrlLauncherState();
}

class _UrlLauncherState extends State<UrlLauncher> {
  String url = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("başlık"),
          centerTitle: true,
        ),
        body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  url =
                      "mailto:deneme@deneme.com?subject=New%20Subject&body=New%20Body";
                  urlLauncher(url);
                },
                child: Text("Send Mail"),
              ),
              ElevatedButton(
                onPressed: () {
                  url =
                      "sms:05325152547";
                  urlLauncher(url);
                },
                child: Text("Send Sms"),
              ),
              ElevatedButton(
                onPressed: () {
                  url ="tel:+90 532 515 25 47";
                  urlLauncher(url);
                },
                child: Text("MAke a Call"),
              ),
               ElevatedButton(
                onPressed: () {
                  url ="https://www.google.com";
                  urlLauncher(url);
                },
                child: Text("Go Website"),
              ),
            ],
          ),
        ),
      ),
      ),      
    );
  }

   void urlLauncher(String url) async {
    if (await canLaunch(url)) {
      await launch(url,forceWebView: true,forceSafariVC: true);
    } else {
      throw "CouId not launch $url";
    }
  }
}
