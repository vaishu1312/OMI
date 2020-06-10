import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Task 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedLocation; // Option 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            //height: 500.0,
            width: 400.0,
            padding: EdgeInsets.all(10.0),
            color: Color(0xFF9CD8F9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(TextSpan(
                  text: 'hi',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                )),
                MyLink(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: Colors.purpleAccent,
                        style: BorderStyle.solid,
                        width: 0.80),
                  ),
                  child: DropdownButton(
                    hint: Text(
                        'Please choose a location'), // Not necessary for Option 1
                    value: _selectedLocation,
                    icon: Icon(Icons.keyboard_arrow_down),
                    style: TextStyle(color: Colors.deepPurple),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLocation = newValue;
                      });
                    },
                    items: _locations.map((location) {
                      return DropdownMenuItem(
                        child: Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  color: Colors.white30,
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(4.0),
                    shrinkWrap: true,
                    children: List.generate(4, (index) {
                      return GridTile(
                        child: Card(
                          color: Colors.blue.shade200,
                        
                          child: DropdownButton(
                            hint: Text(
                                'Select'), // Not necessary for Option 1
                            value: _selectedLocation,
                            icon: Icon(Icons.keyboard_arrow_down),
                            style: TextStyle(color: Colors.deepPurple),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedLocation = newValue;
                              });
                            },
                            items: _locations.map((location) {
                              return DropdownMenuItem(                                
                                child: MyLink(),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    }),
                  ),
                )
              ],
            )));
  }
}

class MyLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: launchURL,
        child: Container(
          padding: EdgeInsets.all(5.0),
          color: Colors.yellow,
          child: Text(
            'Hell World',
          ),
        ));
  }

  launchURL() async {
    const url = 'https://flutter.dev/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
