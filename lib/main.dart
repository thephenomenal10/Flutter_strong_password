import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  double opacity1 = 0.3;
  double opacity2 = 0.3;
  double opacity3 = 0.3;
  bool flag1 = false;
  bool flag2 = false;
  bool flag3 = false;

  void checkConstraints(var value) {
    if (value.length > 6) {
      setState(() {
        opacity1 = 1.0;
        flag1 = true;
      });
    } else {
      setState(() {
        opacity1 = 0.3;
        flag1 = false;
      });
    }

    if (value.contains(new RegExp(r'[A-Z]'))) {
      setState(() {
        opacity3 = 1.0;
        flag3 = true;
      });
    } else {
      setState(() {
        opacity3 = 0.3;
        flag3 = false;
      });
    }

    if (value.contains(new RegExp(r'[0-9]')) &&
        value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]')) &&
        value.contains(new RegExp(r'[a-z]'))) {
      setState(() {
        opacity2 = 1.0;
        flag2 = true;
      });
    } else {
      setState(() {
        opacity2 = 0.3;
        flag2 = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Validation'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: <Widget>[
                TextField(
                  autofocus:
                      true, //opens keyborad automatically when text feild is shown

                  onChanged: (value) {
                    print(value);
                    checkConstraints(value);
                  }, // gets called for each input char, no setState is required

                  style: TextStyle(
                    color: Colors.black,
                  ),

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[50],
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide.none //box outline
                        ),
                  ),
                ),
                Opacity(
                  opacity: opacity1,
                  child: ListTile(
                    leading: Icon(Icons.check),
                    title: Text('must be 7 to 32 characters long'),
                  ),
                ),
                Opacity(
                  opacity: opacity2,
                  child: ListTile(
                    leading: Icon(Icons.check),
                    title: Text(
                        'must contain letters, numbers, and special characters'),
                  ),
                ),
                Opacity(
                  opacity: opacity3,
                  child: ListTile(
                    leading: Icon(Icons.check),
                    title: Text('must contain atleast one capital letter'),
                  ),
                ),
                (flag1 && flag2 && flag3)
                    ? RaisedButton(
                        onPressed: () {},
                        child: Text('Next'),
                      )
                    : Container()
              ],
            ),
          ),
        ));
  }
}
