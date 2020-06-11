import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String serverGetResponse = 'Server get response';
  String serverPostResponse = 'Server post response';
  final getController = TextEditingController();
  final postController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    getController.dispose();
    postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Container(
                //height: 500.0,
                //width: 400.0,
                padding: EdgeInsets.all(10.0),
                color: Color(0xFF9CD8F9),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.purpleAccent,
                                      style: BorderStyle.solid,
                                      width: 0.80)),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: SizedBox(
                                width: 200,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter your name: '),
                                  controller: getController,
                                ))),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: SizedBox(
                              width: 200,
                              child: RaisedButton(
                                child: Text('Send get request'),
                                onPressed: () {
                                  _makeGetRequest();
                                },
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(serverGetResponse),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.purpleAccent,
                                      style: BorderStyle.solid,
                                      width: 0.80)),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: SizedBox(
                                width: 200,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter five comma separated nos: '),
                                  controller: postController,
                                ))),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: SizedBox(
                              width: 200,
                              child: RaisedButton(
                                child: Text('Send post request'),
                                onPressed: () {
                                  _makePostRequest();
                                },
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(serverPostResponse),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))));
   
  }

  _makeGetRequest() async {
    var str=_localhost()+"?name="+getController.text.toString();
    Response response = await get(str);
    setState(() {
      serverGetResponse = response.body;
    });
  }

  _makePostRequest() async {
    var str=_localhost()+"post";
    var dummy=postController.text.toString();
    var arr=dummy.split(",");
    Map<String, String> headers = {"Content-type": "text/plain"};
    String json = '{"N1":'+ arr[0]+', "N2": '+arr[1]+', "N3": '+arr[2]+', "N4": '+arr[3]+', "N5": '+arr[4]+'}';
    Response response = await post(str,headers: headers, body: json);
    setState(() {
      serverPostResponse = response.body;
    });
  }
  


  String _localhost() {
    return 'http://localhost:8081/';
    /*if(Platform.isWindows)
      return 'http://127.0.0.1:8081';
    else if (Platform.isMacOS)
      return 'http://localhost:8081';
    else if (Platform.isAndroid)
      return 'http://10.0.2.2:8081';
    else if(Platform.isIOS)
      return 'http://localhost:8081';
    else 
      return null;*/
  }
}
