import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 1.9',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = [
      true,
      false,
      false,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 1.9 demo'),
      ),
      body: SingleChildScrollView(
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcOut),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ToggleButtons(
                children: <Widget>[
                  Icon(Icons.home),
                  Icon(Icons.ac_unit),
                  Icon(Icons.access_alarm),
                ],
                isSelected: isSelected,
                onPressed: (index) {
                  setState(() {
                    for (var i = 0; i < isSelected.length; i++) {
                      if (i == index) {
                        isSelected[i] = true;
                      } else {
                        isSelected[i] = false;
                      }
                    }
                  });
                },
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SelectableText(
                  "This is a selectable text, try selecting by long tap.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
